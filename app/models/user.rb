class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :last_name, :role
  validates :email, presence: true, uniqueness: true

  enum role: ["student", "teacher", "admin"]

end
