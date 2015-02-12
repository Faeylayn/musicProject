class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, :presence => true
  validates :email, uniqueness: true

  before_validation :ensure_session_token
  has_many(:notes,
      :class_name => "Note",
      :foreign_key => :user_id,
      :primary_key => :id

  )


  def self.find_by_credentials(email, password)
    user = User.find_by(:email => email)
    return user if user.is_password?(password)
    nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end

  def password=(value)
    self.password_digest = BCrypt::Password.create(value)
  end

  def is_password?(value)
    pass = BCrypt::Password.new(self.password_digest)
    pass.is_password?(value)
  end

  def is_activated?
    self.activated
  end

  def is_admin?
    self.admin
  end




end
