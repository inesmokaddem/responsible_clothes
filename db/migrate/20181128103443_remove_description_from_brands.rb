class RemoveDescriptionFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :description, :string
  end
end
