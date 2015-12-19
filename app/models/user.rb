class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\A\d+\z/
    
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
    validates :phone, presence: true, length: { maximum: 50 },
                      format: { with: VALID_PHONE_REGEX }
    validates :academy, presence: true, length: { maximum: 255 }
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password
end
