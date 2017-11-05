class Exam < ApplicationRecord
  has_many :exam_questions
  has_many :exam_categories
  has_many :user_exams

  validates :name, presence: true, length: { maximum: 255 }
end
