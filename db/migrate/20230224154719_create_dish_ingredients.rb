class CreateDishIngredients < ActiveRecord::Migration[7.0]
  def change
    create_join_table :dishes, :ingredients
  end
end
