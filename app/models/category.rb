class Category < ApplicationRecord
  has_many :exam_categories

  validates :name, presence: true, length: { maximum: 255 }
end
