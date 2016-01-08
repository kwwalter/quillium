class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  validates :password, length: { minimum: 8, allow_nil: true }

  has_many :stories, dependent: :destroy
  has_many :edits, through: :stories, dependent: :destroy
end
