class Category < ApplicationRecord
  has_many :exam_categories

  validate :name, presence: true, length: { maximum: 255 }
end
