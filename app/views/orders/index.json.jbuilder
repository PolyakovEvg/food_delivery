# frozen_string_literal: true

json.array! @ordered_dishes.map { |dish| { name: dish.name, count: dish.count } }
