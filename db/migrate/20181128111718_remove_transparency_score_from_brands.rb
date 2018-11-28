class RemoveTransparencyScoreFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :transparency_score, :float
  end
end
