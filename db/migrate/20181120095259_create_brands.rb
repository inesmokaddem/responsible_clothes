class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :description
      t.string :country
      t.integer :rating

      t.timestamps
    end
  end
end
