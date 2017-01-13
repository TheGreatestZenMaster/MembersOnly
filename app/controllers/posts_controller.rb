class PostsController < ApplicationController
    before_action :signed_in_user, only: [:new, :create]
        
    def new
        @post = Post.new
    end
    
    def create
        current_user = User.find_by(id: cookies[:user_id])
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to root_path
    end
    
    def index
        @current_user = User.find_by(id: cookies[:user_id])
        @posts = Post.all
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :body)
    end
    
    def signed_in_user
        unless signed_in?
            redirect_to login_path
        end
    end
    
    def signed_in?
        current_user =  User.find_by(id: cookies[:user_id])
        !current_user.nil? 
    end
end
