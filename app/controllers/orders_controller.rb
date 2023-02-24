class OrdersController < ApplicationController

    def index
        @dishes = Dish.all
        @ingredients = Ingredient.all
    end

    def create
        @filtered = Dish.where.not(id: DishesIngredient.where(ingredient_id: ingredient_ids).select(:dish_id))
        render 'filtered'
    end

    private

    def ingredient_ids
        params[:ingredient_ids]
    end

    def dishes_filter

    end

end
