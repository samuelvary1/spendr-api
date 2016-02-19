class User < ActiveRecord::Base
  has_secure_password
  before_save :verify_authentication_token

  def self.authenticate(credentials)
    user = self.find_by(email: credentials[:username])
    user if user && user.authenticate(credentials[:password])
  end

  private

  def verify_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_auth_token
    end
  end

  def generate_auth_token
    loop do
      token = SecureRandom.urlsafe_base64(15)
      break token unless User.where(authentication_token: token).any?
    end
  end
end
