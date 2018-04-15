class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.references :zip, foreign_key: true
      t.string :name
      t.string :location
      t.integer :category

      t.timestamps
    end
  end
end
