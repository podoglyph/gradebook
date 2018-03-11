require 'rails_helper'

RSpec.describe Semester, type: :model do

  describe "ActiveModel validations" do
    it {should validate_presence_of(:term)}
  end

  describe "ActiveRecord associations" do
    it {should have_many(:semester_courses)}
    it {should have_many(:courses).through(:semester_courses)}
  end

end
