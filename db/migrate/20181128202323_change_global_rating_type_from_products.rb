class ChangeGlobalRatingTypeFromProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :global_rating, :decimal
  end
end
