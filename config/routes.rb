# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :orders, only: %i[index create]
  post '/filtered', to: 'orders#filtered'
  root 'orders#index'
end
