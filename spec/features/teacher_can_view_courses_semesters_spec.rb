require 'rails_helper'

RSpec.describe "Teacher Dashboard" do

  let(:user) {create(:user, role: :teacher)}
  attr_reader :courses, :semester

  before(:each) do
    @semester = Semester.create!(term: "Spring 2018")
    @courses = create_list(:course, 2, user_id: user.id)

    semester.courses << courses

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit(teacher_dashboard_index_path)
  end

  context "when visiting the teacher dashboard" do

    it "can see a list of its courses and the associated semester" do
      expect(current_path).to eq(teacher_dashboard_index_path)
      expect(page).to have_content(courses.first.name)
      expect(page).to have_content(semester.term)
      expect(page).to have_content(courses.last.name)
    end

    xit "can click on a course to see the course show page" do
      expect(current_path).to eq(teacher_dashboard_index_path)

      click_on courses[0].name

      expect(current_path).to eq(teacher_course_path(courses[0].id))
    end

  end
end
