class ChangeEanTypeFromProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :ean, :string
  end
end
