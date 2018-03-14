# Gradebook

![travis_status](https://travis-ci.org/podoglyph/gradebook.svg?branch=master)

Gradebook is an app for teachers, students, and administrators to view and record data on classes, enrollments, and grades for given semesters.

Take it for a spin using the credentials for Teacher, Student, and Admin below: https://gradebook-v.herokuapp.com/

This app is built with:

* `Rails 5.1.5`
* `Ruby 2.4.1`
* `PostgreSQL 10.2`

To run:

1. Clone this repo and `cd gradebook`
3. `rails db:create`
4. `rails db:migrate`
5. `rails db:seed`
5.  Visit `localhost:3000` and login using default credentials below:

As a Teacher:
* email: "teacher@email.com"
* Password "password"

As a Student:
* email: "student1@email.com", "student2@email.com"..."student100@email.com"
* Password "password"

As an Admin:
* email: "admin@email.com"
* Password "password"


## License

This project is licensed under the MIT License.
