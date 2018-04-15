class CreateCounties < ActiveRecord::Migration[5.1]
  def change
    create_table :counties do |t|
      t.string :name
      t.integer :population_count

      t.timestamps
    end
  end
end
