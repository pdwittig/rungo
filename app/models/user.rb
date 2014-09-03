class User < ActiveRecord::Base
  has_secure_password
  has_one :api_key

  validates :email, presence: true
  validates :email, uniqueness: true
  
  
end

