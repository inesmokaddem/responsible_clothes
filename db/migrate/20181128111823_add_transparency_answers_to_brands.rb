class AddTransparencyAnswersToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :transparency_answers, :integer
  end
end
