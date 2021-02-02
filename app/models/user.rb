class User < ApplicationRecord

  # attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  has_many :posts
  has_many :responses

  enum user_type: [:seeker, :helper]




end
