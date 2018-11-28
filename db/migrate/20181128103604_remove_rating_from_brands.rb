class RemoveRatingFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :rating, :integer
  end
end
