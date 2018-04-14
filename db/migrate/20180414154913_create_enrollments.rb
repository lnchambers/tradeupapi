class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
      t.references :institution, foreign_key: true
      t.references :program, foreign_key: true
      t.integer :year
      t.integer :max_age
      t.integer :min_age
      t.string :gender
      t.string :ethnicity
      t.integer :residency
      t.string :degree_level

      t.timestamps
    end
  end
end
