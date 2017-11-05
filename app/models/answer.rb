class Answer < ApplicationRecord
  belongs_to :question
  has_many :exam_results

  validates :content, presence: true
  validates :is_correct, presence: true
end
