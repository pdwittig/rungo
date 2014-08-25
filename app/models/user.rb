class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  has_one api_key
end

