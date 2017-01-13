class SessionsController < ApplicationController
    
    def new 
      @current_user = User.find_by(id: cookies[:user_id])
    end
    
    def create
      @current_user = User.find_by(id: cookies[:user_id])
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        flash[:success] = 'Thank you for signing in!'
        sign_in user
        redirect_to root_path        
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end
    
    def destroy
      sign_out
      redirect_to root_url
    end
end
