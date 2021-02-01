class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :posts
  has_many :responses

  enum user_type: [:seeker, :helper]

end
