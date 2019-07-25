# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# Validate the presence of username and session_token
# Validate the presence of password_digest and set the error message to Password can't be blank
# Validate the length of password, and set allow_nil to true
# Make sure that ensure_session_token gets called before_validation

class User < ApplicationRecord
  validates :username, presence: true
  validates :password_digest, presence: true, length: {minimum: 6}

  attr_reader :password

  def self.find_by_credentials

  end

  def self.generate_session_token

  end

  def reset_session_token

  end

  def ensure_session_token
  end

  def password=(pw)

  end
end
