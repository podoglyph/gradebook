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

  def self.average_course_grades
    joins(:semester, :course, :enrollments)
      .select("AVG(enrollments.grade) AS avg_grade, courses.name AS name, semesters.term AS term, semester_courses.id as id")
      .group("semester_courses.id, courses.name, semesters.term")
  end

end
