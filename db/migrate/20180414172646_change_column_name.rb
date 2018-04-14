class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :institutions, :type, :type_of_institution
  end
end
