class ExamCategory < ApplicationRecord
  belongs_to :exam
  belongs_to :category
end
