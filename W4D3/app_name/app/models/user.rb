# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class User < ApplicationRecord
  attr_reader :password

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length:{minimum: 8, allow_nil: true}
  before_validation :ensure_session_token

  def self.find_by_credentials(sign_in,pass_word)
    user = User.find_by(username: sign_in)
    return user if user && user.is_password?(pass_word)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.reset_session_token!
    session_token = self.class.generate_session_token
    self.save!
    session_token
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end


  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
