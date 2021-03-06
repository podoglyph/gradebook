require 'rails_helper'

RSpec.describe "Admin Dashboard" do

  let(:users) {create_list(:user, 2, role: :student)}
  let(:admin) {create(:user, role: :admin)}
  let(:teacher) {create(:user, role: :teacher)}

  attr_reader :courses, :semester, :semester2, :sem_courses

  before(:each) do
    @semester = create(:semester, term: "Spring 1922", current: false)
    @semester2 = create(:semester, term: "Fall 1922", current: false)

    @courses = create_list(:course, 4, user_id: teacher.id)

    semester.courses.push(courses[0], courses[1])
    semester2.courses.push(courses[2], courses[3])

    @sem_courses = SemesterCourse.all

    users[0].enrollments.create!(grade: 99, semester_course_id: sem_courses[0].id )
    users[0].enrollments.create!(grade: 93, semester_course_id: sem_courses[1].id )
    users[0].enrollments.create!(grade: 99, semester_course_id: sem_courses[2].id )
    users[0].enrollments.create!(grade: 93, semester_course_id: sem_courses[3].id )

    users[1].enrollments.create!(grade: 92, semester_course_id: sem_courses[0].id )
    users[1].enrollments.create!(grade: 95, semester_course_id: sem_courses[1].id )
    users[1].enrollments.create!(grade: 92, semester_course_id: sem_courses[2].id )
    users[1].enrollments.create!(grade: 95, semester_course_id: sem_courses[3].id )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit(admin_dashboard_index_path)
  end

  context "when visiting the admin dashboard" do

    it "can see list of semesters with enrollment counts" do
      expect(current_path).to eq(admin_dashboard_index_path)

      expect(page).to have_content("Welcome, #{admin.first_name}")

      within('div.admin-total-enrollments') do
        expect(page).to have_content("#{semester.term} Enrollment: 4 Students")
        expect(page).to have_content("#{semester2.term} Enrollment: 4 Students")
      end

    end

    it "can see average grade for a given course" do
      expect(current_path).to eq(admin_dashboard_index_path)

      within("table.avg-course-grade") do
        expect(page).to have_css('.sem-course-record', count: 4)
        first("tr") do
          expect(page).to have_content("#{courses[0].name}")
          expect(page).to have_content("#{semester.term}")
          expect(page).to have_content(96)
        end
      end
    end
    
  end
end
