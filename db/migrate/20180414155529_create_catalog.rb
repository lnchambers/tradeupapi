class CreateCatalog < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogs do |t|
      t.references :institution, foreign_key: true
      t.references :program, foreign_key: true
    end
  end
end
