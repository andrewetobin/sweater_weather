require 'securerandom'

class User < ApplicationRecord
  has_many :favorites
  has_many :cities, through: :favorites, dependent: :delete_all
  before_create :generate_api_key

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :password_confirmation, require: true
  validates_presence_of :api_key, require: true

  has_secure_password

  def generate_api_key
    self.api_key = SecureRandom.uuid
  end
end
