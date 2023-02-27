# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @allergens = IngredientsOrder.select(:ingredient_id)

    @ordered_dishes = Dish.joins(:dishes_orders)
                          .select('dishes.name, COUNT(dishes_orders.dish_id) AS count')
                          .group('dishes.id')
                          .order('count DESC')

    @dishes = Dish.order('RANDOM()').limit(8)
    @ingredients = Ingredient.all
    # обновление  json
    # respond_to do |format|
    #   format.json do
    #     json = Dish.all.map do |d|
    #       orders = IngredientsOrder.where.not(ingredient_id: d.ingredient_ids).group(:order_id)
    #       {name: d.name, count: orders.count.keys.size }
    #     end
    #     render json: json
    #     end
    #     format.html {}
    #   end
  end

  def create
    order = Order.new
    order_alergens = Ingredient.where(id: session[:allergens])
    order.ingredients = order_alergens

    filtered_dishes = Dish.where.not(id: DishesIngredient.where(ingredient_id: order_alergens).select(:dish_id))
    order.dishes = filtered_dishes
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
