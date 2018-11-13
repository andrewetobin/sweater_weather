class City < ApplicationRecord
  validates_presence_of :name, :state
  has_many :favorites
  has_many :users, through: :favorites, dependent: :delete_all
end
