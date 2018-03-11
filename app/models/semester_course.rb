class SemesterCourse < ApplicationRecord
  belongs_to :course
  belongs_to :semester

  has_many :enrollments
  has_many :users, through: :enrollments


  def self.student_courses(student)
    data = joins(:semester, :enrollments, :course).where("enrollments.user_id = ? ", student.id).select("courses.name AS name, enrollments.grade AS grade, semesters.term AS term")

    data.map do |cd|
      {
        name: cd.name,
        semester: cd.term,
        grade: cd.grade
      }
    end
  end

end
