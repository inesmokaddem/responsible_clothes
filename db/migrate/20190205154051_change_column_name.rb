class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :compositions, :pourcentage, :percentage
  end
end
