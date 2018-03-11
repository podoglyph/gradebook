require 'rails_helper'

RSpec.describe Enrollment, type: :model do

  describe "ActiveModel validations" do
    it {should validate_presence_of(:grade)}
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:semester_course_id)}
  end

  describe "ActiveRecord associations" do
    it {should belong_to(:semester_course)}
    it {should belong_to(:user)}
  end

end
