# frozen_string_literal: true

class CreateJoinTableDishOrders < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :dishes
  end
end
