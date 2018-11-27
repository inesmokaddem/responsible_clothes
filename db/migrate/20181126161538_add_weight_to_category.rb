class AddWeightToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :weight, :float
  end
end
