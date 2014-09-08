class User < ActiveRecord::Base
  has_secure_password
  has_one :auth_token
  has_one :setting

  validates :email, presence: true
  validates :email, uniqueness: true

  after_create :create_empty_settings;

  private
  def create_empty_settings
    self.create_setting
  end

end

