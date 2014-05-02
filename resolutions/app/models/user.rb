class User < ActiveRecord::Base
  attr_reader :password

  before_validation :ensure_session_token
  validates :username, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }, on: :create

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user.try(:is_password?, password) ? user : nil
  end

  def password=(plain_text)
    @password = plain_text
    self.password_digest = BCrypt::Password.create(plain_text) unless plain_text.empty?
  end

  def is_password?(plain_text)
    BCrypt::Password.new(self.password_digest).is_password?(plain_text)
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.hex
  end
end
