require 'rails_helper'

RSpec.describe Category, type: :request do
  describe 'GET /categories' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /categories/new' do
    it 'returns http success' do
      get new_category_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /categories/:id' do
    it 'returns http success' do
      get category_path(1)
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /categories' do
    it 'returns http success' do
      post categories_path
      expect(response).to have_http_status(302)
    end
  end
end
