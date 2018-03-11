require 'rails_helper'

RSpec.describe "Teacher Dashboard" do

  let(:user) {create(:user, role: :teacher)}
  attr_reader :course, :course2, :semester

  before(:each) do
    @semester = Semester.create!(term: "Spring 2018")
    courses = create_list(:course, 2, user_id: user.id)
    @course = courses.first
    @course2 = courses.last

    semester.courses << courses

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  context "when visiting the teacher dashboard" do

    it "can see a list of its courses and the associated semester" do
      visit(teacher_dashboard_index_path)
      expect(current_path).to eq(teacher_dashboard_index_path)
      expect(page).to have_content(course.name)
      expect(page).to have_content(semester.term)
      expect(page).to have_content(course2.name)
    end

    it "can click on a course to see the course show page" do
      visit(teacher_dashboard_index_path)
      expect(current_path).to eq(teacher_dashboard_index_path)

      click_on course.name

      expect(current_path).to eq(teacher_course_path(course.id))
    end

  end
end
