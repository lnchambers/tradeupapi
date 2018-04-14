class CreateCatalog < ActiveRecord::Migration[5.1]
  def change
    create_table :catalogs do |t|
      t.keys :institution
      t.keys :program
    end
  end
end
