# frozen_string_literal: true

class DishesIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
end
