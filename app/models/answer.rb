class Answer < ApplicationRecord
  belongs_to :question, optional: true
  has_many :exam_results
  before_save :to_bool_is_correct

  validates :content, presence: true

  private
    def to_bool_is_correct
      self.is_correct = self.is_correct == "1"
    end
end
