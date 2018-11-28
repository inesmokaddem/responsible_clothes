class RemoveLaborScoreFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :labor_score, :float
  end
end
