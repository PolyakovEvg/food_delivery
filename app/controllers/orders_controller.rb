class OrdersController < ApplicationController

    def index
        @dishes = Dish.all
        @ingredients = Ingredient.all
    end

    def create
      allergens = session[:allergens]
      order = Order.new 
      @filtered = Dish.where.not(id: DishesIngredient.where(ingredient_id: allergens).select(:dish_id))
      order.dishes << @filtered
      order.save
      redirect_to root_path
      flash[:sucess] = 'Ваша заказ оформлен!'
    
    end

    def filtered
      @filtered = Dish.where.not(id: DishesIngredient.where(ingredient_id: ingredient_ids).select(:dish_id))
        @allergies = Ingredient.where(id: ingredient_ids)
        render 'filtered'
    end
    private

    def ingredient_ids
        session[:allergens] = params[:ingredient_ids]
    end

    def dishes_filter

    end

end
