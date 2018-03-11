class Seed

  def self.seed_me
    create_teacher
    create_admin
    create_students
    create_teacher_courses
    create_semesters
    add_courses_to_semester
    enroll_students
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
    70.times do |i|
      student = User.create(
        first_name: Faker::Name.unique.first_name,
        last_name: Faker::Name.unique.last_name,
        email: "student#{i}@email.com",
        password: "password",
        role: "student"
      )
      puts "Created Student #{student.first_name}."
    end
  end

  def self.create_teacher_courses
    teacher = User.first
    courses = %w(Physics Astronomy History Mathematics Philosophy)

    courses.each do |c|
      teacher.courses.create!(name: c)
      puts "Created Course #{c}."
    end
  end

  def self.create_semesters
    semesters = ["Spring 2018", "Fall 2018"]

    semesters.each do |s|
      Semester.create!(term: s)
    end

    current_sem = Semester.find_by(term: "Spring 2018")
    current_sem.update(current: true)
  end

  def self.add_courses_to_semester
    courses = Course.all
    semesters = Semester.all

    semesters.each do |s|
      s.courses << courses.sample(3)
      puts "Added 3 Courses to #{s.term}."
    end
  end

  def self.enroll_students

    sem_courses = SemesterCourse.all

    sem_courses.each do |sem|
      students = User.where(role: "student").order("RANDOM()").limit(12)
      students.each do |s|
        s.enrollments.create!(grade: Faker::Number.between(70, 100), semester_course_id: sem.id)
        puts "Added enrollment for #{s.first_name}."
      end
    end

  end

end

Seed.seed_me
