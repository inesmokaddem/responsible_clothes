class CreateCompositions < ActiveRecord::Migration[5.2]
  def change
    create_table :compositions do |t|
      t.integer :pourcentage
      t.references :product, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
