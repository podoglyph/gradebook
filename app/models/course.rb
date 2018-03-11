class Course < ApplicationRecord
  validates_presence_of :name, :user_id

  belongs_to :user
  has_many :semester_courses
  has_many :semesters, through: :semester_courses
  has_many :enrollments, through: :semester_courses


  def self.view_course(course_id, semester_term)
    {
      course_name: Course.find(course_id).name,
      semester_term: semester_term
    }
  end

  def self.teacher_courses(teacher)
    joins(:semesters)
    .where(user_id: teacher.id)
    .select("courses.id, courses.name AS course_name, semesters.term AS semester_term, semesters.id AS semester_id")
    .order("semesters.id")
  end

end
