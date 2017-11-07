class ExamResult < ApplicationRecord
  belongs_to :answer
  belongs_to :user_exam, optional: true
end
