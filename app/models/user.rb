class User < ApplicationRecord
  validates_presence_of :password_digest, presence: true
  validates_presence_of :first_name, presence: true
  validates_presence_of :last_name, presence: true
  validates_presence_of :username, presence: true, uniqueness: true
  validates_presence_of :state, presence: true

  has_secure_password

  # has_many :user_events
  # has_many :events, through: :user_events
end
