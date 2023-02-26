# frozen_string_literal: true

class Dish < ApplicationRecord
  has_many :dishes_ingredients
  has_many :ingredients, through: :dishes_ingredients
  has_many :dishes_orders, counter_cache: true
  has_many :orders, through: :dishes_orders
end
