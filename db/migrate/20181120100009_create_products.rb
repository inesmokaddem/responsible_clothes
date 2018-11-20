class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :water_footprint
      t.integer :carbon_footprint
      t.integer :social_rating
      t.integer :eco_rating
      t.integer :global_rating
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
