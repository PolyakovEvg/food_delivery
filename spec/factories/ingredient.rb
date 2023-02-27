# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    name { ('a'..'z').to_a.sample(5).join }
  end

  factory :sugar, class: Ingredient do
    id { 1 }
    name { 'Sugar' }
  end

  factory :salt, class: Ingredient do
    id { 2 }
    name { 'Salt' }
  end
end
