require 'rails_helper'

RSpec.describe SemesterCourse, type: :model do

  describe "ActiveRecord associations" do
    it {should belong_to(:course)}
    it {should belong_to(:semester)}
    it {should have_many(:enrollments)}
    it {should have_many(:users).through(:enrollments)}
  end

end
