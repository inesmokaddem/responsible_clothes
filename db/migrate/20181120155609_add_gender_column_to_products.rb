class AddGenderColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :gender, :integer
  end
end
