# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :session_token, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password, length:{minimum: 6, allow_nil: true}
  attr_reader :password
  after_initialize :ensure_session_token

  has_many(
    :boards,
    class_name: :Board,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :memberships,
    class_name: :BoardMember,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(:watch_boards, through: :memberships, source: :board)


  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
