class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :last_name, :role
  validates :email, presence: true, uniqueness: true

  enum role: ["student", "teacher", "admin"]

  has_many :courses
  has_many :enrollments
  has_many :semester_courses, through: :enrollments

end
