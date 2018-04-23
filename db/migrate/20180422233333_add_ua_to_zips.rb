class AddUaToZips < ActiveRecord::Migration[5.1]
  def change
    add_column :zips, :ua, :integer
  end
end
