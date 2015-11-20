class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :concert, counter_cache: true

  validates :body, presence: true

  def self.persisted
    where.not(id: nil)
  end
end
