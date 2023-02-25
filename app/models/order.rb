class Order < ApplicationRecord
    has_many :dishes_orders
    has_many :dishes, through: :dishes_orders
end
