# frozen_string_literal: true

class DishesIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  after_create :update_orders

  private

  # хук для обновления json
  def update_orders
    Order.find_each do |order|
      order.dishes = Dish.where.not(id: DishesIngredient.where(ingredient_id: order.ingredients).select(:dish_id))
    end
  end
end
