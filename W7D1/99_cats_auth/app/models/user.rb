class Users < ApplicationRecord
    validates :user_name, presence:true, uniqueness:true
    validates :password_digest, presence:true
    validates :session_token, presence:true, uniqueness:true

    after_initialize :ensure_session_token

    def reset_session_token
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        puts "this is setting your session_token"
        self.session_token ||= SecureRandom::urlsafe_base64
    end
        
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    def check_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end
    

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        if user && user.check_password?(password)
            return user
        else
            return nil
        end
    end

end
