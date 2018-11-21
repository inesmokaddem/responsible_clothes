class AddEanToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :ean, :integer
  end
end
