class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  has_many :reservation
  belongs_to :user
end
