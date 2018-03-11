class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.integer :grade
      t.references :user, foreign_key: true
      t.references :semester_course, foreign_key: true

      t.timestamps
    end
  end
end
