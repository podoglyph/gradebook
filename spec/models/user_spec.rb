require 'rails_helper'

RSpec.describe User, type: :model do

  describe "ActiveModel validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:role)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should have_secure_password}
  end

  describe "ActiveRecord associations" do
    it {should have_many(:courses)}
  end


end
