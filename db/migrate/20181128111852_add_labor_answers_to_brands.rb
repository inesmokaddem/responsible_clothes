class AddLaborAnswersToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :labor_answers, :integer
  end
end
