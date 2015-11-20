class Concert < ActiveRecord::Base
  validates :band, presence: true
  validates :band, length: { maximum: 40 }

  validates :venue, presence: true
  validates :venue, length: { maximum: 40 }

  validates :city, presence: true
  validates :city, length: { maximum: 40 }

  validates :date, presence: true

  validates :price, presence: true
  validates :price, numericality: true

  validates :description, presence: true
  validates :description, length: { maximum: 300 }
end
