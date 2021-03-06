class User < ActiveRecord::Base

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  attr_reader :password

  has_many :goals

  has_many :received_comments,
    class_name: "UserComment",
    foreign_key: :recipient_id,
    primary_key: :id

  has_many :sent_comments,
    class_name: "UserComment",
    foreign_key: :author_id,
    primary_key: :id

    has_many :goal_comments,
      class_name: "GoalComment",
      foreign_key: :author_id,
      primary_key: :id


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    @user = User.find_by_username(username)

    return nil unless @user

    if @user.is_password?(password)
      @user
    else
      nil
    end
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
end
