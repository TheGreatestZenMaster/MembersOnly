class User < ApplicationRecord
    has_many :posts
    attr_accessor :remember_token
    before_create :create_remember_token
    validates :password, length: {minimum: 6 }
    has_secure_password
    
    # Returns a random token.
    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end
    
    # Returns the hash digest of the given string.
    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    def create_remember_token
        self.remember_token = User.digest(User.new_remember_token)
    end
        
end
