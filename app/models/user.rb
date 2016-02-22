class User < ActiveRecord::Base
	has_secure_password

	has_many :categories
	has_many :expenses

	before_save :verify_authentication_token

  def self.authenticate(credentials)
    user = self.find_by(username: credentials[:username])
    user if user && user.authenticate(credentials[:password])
  end

	def self.create_from_ember(user_parameters)
		user = User.where(
			username: user_parameters[:username],
			monthly_salary: user_parameters[:monthly_salary],
			password: user_parameters[:password],
			password_confirmation: user_parameters[:password_confirmation])
			.first_or_create
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
