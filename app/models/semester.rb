class Semester < ApplicationRecord
  validates_presence_of :term

  has_many :semester_courses
  has_many :courses, through: :semester_courses
  has_many :enrollments, through: :semester_courses


  def self.total_enrollments
    semesters = Semester.joins(:enrollments).group("semesters.id")

    semesters.map do |s|
      {
        term: s.term,
        total_enrolled: s.enrollments.count
      }
    end

  end

end
