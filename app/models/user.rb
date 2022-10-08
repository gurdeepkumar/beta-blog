class User < ApplicationRecord
  # has_many :article
  validates :user, presence: true, 
                    length: { minimum: 3, maximum: 16 }, 
                    uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,  
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 16 },
                    format: { with: VALID_EMAIL_REGEX } 

end
