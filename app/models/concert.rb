class Concert < ActiveRecord::Base
  belongs_to :user
  has_many :comments

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

  def self.concerts_today num=3
    where('date BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).limit(num)
  end

  def self.concerts_later num=3
    where('date BETWEEN ? AND ?', DateTime.now.end_of_day, DateTime.now + 1.month).limit(num)
  end

  def self.search_by_price price
    where('price <= ?', price)
  end
end
