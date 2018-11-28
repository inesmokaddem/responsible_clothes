class AddColumnsToBrand < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :transparency_score, :float
    add_column :brands, :labor_score, :float
  end
end
