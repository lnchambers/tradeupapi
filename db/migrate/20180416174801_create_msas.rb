class CreateMsas < ActiveRecord::Migration[5.1]
  def change
    create_table :msas do |t|
      t.integer :code

      t.timestamps
    end
  end
end
