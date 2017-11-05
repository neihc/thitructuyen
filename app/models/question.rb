class Question < ApplicationRecord
  has_many :answers
  has_many :exam_questions
  accepts_nested_attributes_for :answers

  validates :description, presence: true
end
