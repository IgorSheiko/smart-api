 class User < ActiveRecord::Base
  rolify
  has_secure_password
  has_one :profile, dependent: :destroy, inverse_of: :user
  has_many :projects

  accepts_nested_attributes_for :profile

  validates :email, presence: true, uniqueness: true

  def generate_authentication_token!
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
    end
    save!
    authentication_token
  end
end
