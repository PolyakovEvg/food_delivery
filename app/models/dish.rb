class Dish < ApplicationRecord
    has_many :dishes_ingredients
    has_many :ingredients, through: :dishes_ingredients
    has_many :dishes_orders
    has_many :orders, through: :dishes_orders
end
