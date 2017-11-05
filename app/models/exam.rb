class Exam < ApplicationRecord
  has_many :user_exams
  has_many :exam_questions
  has_many :exam_categories

  has_many :questions, through: :exam_questions
  has_many :categories, through: :exam_categories

  validates :name, presence: true, length: { maximum: 255 }
end
