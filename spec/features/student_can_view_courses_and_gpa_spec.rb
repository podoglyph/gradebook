require 'rails_helper'


RSpec.describe "Student Dashboard" do

  let(:user) {create(:user, role: :student)}
  let(:teacher) {create(:user, role: :teacher)}
  attr_reader :courses, :semester, :semester2

  before(:each) do
    @semester = create(:semester, term: "Spring 1922", current: false)
    @semester2 = create(:semester, term: "Fall 1922", current: false)

    @courses = create_list(:course, 4, user_id: teacher.id)

    semester.courses.push(courses[0], courses[1])
    semester2.courses.push(courses[2], courses[3])

    sem_courses = SemesterCourse.all

    user.enrollments.create!(grade: 99, semester_course_id: sem_courses[0].id )
    user.enrollments.create!(grade: 93, semester_course_id: sem_courses[1].id )
    user.enrollments.create!(grade: 92, semester_course_id: sem_courses[2].id )
    user.enrollments.create!(grade: 95, semester_course_id: sem_courses[3].id )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit(student_dashboard_index_path)
  end

  context "when visiting the student dashboard" do

    it "can see list of courses with grades" do
      expect(current_path).to eq(student_dashboard_index_path)
      expect(page).to have_content("Welcome, #{user.first_name}")
      expect(page).to have_content(courses[0].name)
      expect(page).to have_content(courses[3].name)
      expect(page).to have_content(semester.term)
      expect(page).to have_content(semester2.term)
      expect(page).to have_content(user.enrollments.first.grade)
      expect(page).to have_content(user.enrollments.last.grade)
    end

    it "can see GPA" do
      semester_gpas = Enrollment.gpa(user)

      sgpa1 = "#{semester_gpas.first[:semester_term]}: #{semester_gpas.first[:gpa]}"

      sgpa2 = "#{semester_gpas.last[:semester_term]}: #{semester_gpas.last[:gpa]}"

      expect(current_path).to eq(student_dashboard_index_path)
      expect(page).to have_content(sgpa1)
      expect(page).to have_content(sgpa2)

    end

  end

end
