require 'rails_helper'


RSpec.describe "Teacher Courses" do

  let(:user) {create(:user, role: :teacher)}
  attr_reader :course, :semester, :student

  before(:each) do
    @course = user.courses.create!(name: "Physics")
    @semester = Semester.create!(term: "Spring 2018")
    semester.courses << course
    sem_course = SemesterCourse.first

    @student = create(:user, role: "student")
    student.enrollments.create!(grade: "95", semester_course_id: sem_course.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit(teacher_course_path(course, semester: {semester_id: semester.id, semester_term: semester.term}))
  end

  context "when visiting the teacher course page" do

    it "can see a list of students enrolled in the course and their grades" do
      expect(current_path).to eq(teacher_course_path(course))
      expect(page).to have_content(course.name)
      expect(page).to have_content(semester.term)

      expect(page).to have_content(student.first_name)
      expect(page).to have_content(student.enrollments.first.grade)
    end

  end
end
