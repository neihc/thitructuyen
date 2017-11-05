class Question < ApplicationRecord
  has_many :answers
  has_many :exam_questions

  validates :description, presence: true
end
