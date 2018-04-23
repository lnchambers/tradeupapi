class CreateUas < ActiveRecord::Migration[5.1]
  def change
    create_table :uas do |t|
      t.references :zip, foreign_key: true
      t.references :msa, foreign_key: true
      t.integer :code

      t.timestamps
    end
  end
end
