class AddCountryToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :country, foreign_key: true
  end
end
