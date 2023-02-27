# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:empty) { create :empty_order }
  let(:ingredients) { create_list(:ingredient, 2) }
  let(:empty_dishes_orders) { create :dishes_orders }

  describe 'GET#index' do
    before { get :index }
    context 'required output' do
      it 'render to index template' do
        is_expected.to render_template :index
      end
    end
  end

  describe 'POST#filtered' do
    before { post :filtered, params: { ingredient_ids: ingredients } }
    it 'save session params' do
      expect(session[:allergens]).to eq ingredients.map(&:id).map(&:to_s)
    end
    it 'render template' do
      is_expected.to render_template :filtered
    end
    it 'returns success status' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST#create' do
    before { post :create }
    it 'render template' do
      is_expected.to redirect_to root_path
    end
    it 'returns success status' do
      expect(response).to have_http_status(302)
    end
  end
end
