class UserExam < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  has_many :exam_results
end
