require 'rails_helper'

RSpec.describe Course, type: :model do

  describe "ActiveModel validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:user_id)}
  end

  describe "ActiveRecord associations" do
    it {should belong_to(:user)}
    it {should have_many(:semester_courses)}
    it {should have_many(:semesters).through(:semester_courses)}
  end

end
