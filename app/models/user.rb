class User < ApplicationRecord
  has_many :article
  validates :username, presence: true, 
                    length: { minimum: 3, maximum: 16 }, 
                    uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 100},
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,  
                    length: { minimum: 8, maximum: 16 }
  has_secure_password
end
