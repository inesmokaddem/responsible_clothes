class AddPourcentMaterialToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pourcent_material, :integer
  end
end
