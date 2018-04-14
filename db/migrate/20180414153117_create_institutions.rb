class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.integer :type
      t.integer :tax_type
      t.string :address
      t.string :contact_person
      t.string :contact_email

      t.timestamps
    end
  end
end
