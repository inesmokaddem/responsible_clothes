class RemoveCountryFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :country, :string
  end
end
