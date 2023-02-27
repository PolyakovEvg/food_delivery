# frozen_string_literal: true

FactoryBot.define do
  factory :empty_order, class: Order do
    id { nil }
  end

  factory :order, class: Order do
    id { rand(1..1000) }
  end
end
