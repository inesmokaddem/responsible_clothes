class RemoveGenderFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :gender, :integer
  end
end
