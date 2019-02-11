class RemovePourcentMaterialFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :pourcent_material, :integer
  end
end
