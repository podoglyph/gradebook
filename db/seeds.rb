class Seed

  def self.seed_me
    create_teacher
    create_admin
    create_students
  end

  def self.create_teacher
    teacher = User.create(
      first_name: "Don",
      last_name: "Quixote",
      email: "teacher@email.com",
      password: "password",
      role: "teacher"
    )
    puts "Created Teacher #{teacher.first_name}."
  end

  def self.create_admin
    admin = User.create(
      first_name: "Dulcinea",
      last_name: "del Toboso",
      email: "admin@email.com",
      password: "password",
      role: "admin"
    )
    puts "Created Admin #{admin.first_name}."
  end

  def self.create_students
    10.times do |i|
      student = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: "student#{i}@email.com",
        password: "password",
        role: "student"
      )
      puts "Created Student #{student.first_name}."
    end
  end

end

Seed.seed_me
