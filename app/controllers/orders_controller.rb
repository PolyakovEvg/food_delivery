# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @ordered_dishes = Dish.joins(:dishes_orders)
                          .select('dishes.name, COUNT(dishes_orders.dish_id) AS count')
                          .group('dishes.id')
                          .order('count DESC')
    @dishes = Dish.order('RANDOM()').limit(8)
    @ingredients = Ingredient.all
  end

  def create
    allergens = session[:allergens]
    @filtered = Dish.where.not(id: DishesIngredient.where(ingredient_id: allergens).select(:dish_id))
    order = Order.new
    order.dishes << @filtered
    order.save
    redirect_to root_path
    flash[:success] = 'Ваша заказ оформлен!'
  end

  def filtered
    @filtered = Dish.where.not(id: DishesIngredient.where(ingredient_id: ingredient_ids).select(:dish_id))
    @allergens = Ingredient.where(id: ingredient_ids)
    render 'filtered'
  end

  private

  def ingredient_ids
    session[:allergens] = params[:ingredient_ids]
  end
end
