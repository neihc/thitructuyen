class UserExam < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  has_many :exam_results
  has_many :answers, through: :exam_results
  accepts_nested_attributes_for :exam_results
end
