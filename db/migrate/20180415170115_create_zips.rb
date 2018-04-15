class CreateZips < ActiveRecord::Migration[5.1]
  def change
    create_table :zips do |t|
      t.integer :code
      t.references :county, foreign_key: true
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
