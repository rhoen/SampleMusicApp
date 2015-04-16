class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true
  validates :email, :session_token, uniqueness: true

  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.base_64
  end

  def self.reset_session_token!
    self.session_token ||= self.generate_session_token
    self.save!
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user.is_password?(password)
      user
    else
      nil
    end
  end

  private
  def ensure_session_token
    self.reset_session_token!
  end

end
