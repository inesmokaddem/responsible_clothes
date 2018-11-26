class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :water_foot_print_per_kilo

      t.timestamps
    end
  end
end
