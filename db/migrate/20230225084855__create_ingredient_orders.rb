# frozen_string_literal: true

class CreateIngredientOrders < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :ingredients
  end
end
