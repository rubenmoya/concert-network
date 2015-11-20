class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :concert

  validates :body, presence: true

  def self.persisted
    where.not(id: nil)
  end
end
