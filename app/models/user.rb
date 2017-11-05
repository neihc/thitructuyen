class User < ApplicationRecord
  has_many :user_exams, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :fullname, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX  }, uniqueness: { case_sensitive: false  }

  has_secure_password
end
