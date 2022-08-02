class Record < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :cost, presence: true
  validates :date, presence: true
  validates :category_id, presence: true

  def category_name
    category.name
  end
end
