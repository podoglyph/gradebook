class CreateSemesters < ActiveRecord::Migration[5.1]
  def change
    create_table :semesters do |t|
      t.string :term
      t.boolean :current
      t.timestamps
    end
  end
end
