require 'rails_helper'

RSpec.describe CategoryBudget, type: :request do
  describe 'GET /categories/:id/budgets' do
    it 'returns http success' do
      get category_budgets_path(1)
      expect(response).to have_http_status(302)
    end
  end
end
