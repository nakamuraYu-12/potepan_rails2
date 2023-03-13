class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true

  belongs_to :user
end
