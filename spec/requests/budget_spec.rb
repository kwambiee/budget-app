require 'rails_helper'

RSpec.describe Budget, type: :request do
    describe 'POST/budgets' do
        it 'returns http success' do
            post budgets_path
            expect(response).to have_http_status(302)
        end
    end

    describe 'GET /budgets/new' do
        it 'returns http success' do
            get new_budget_path
            expect(response).to have_http_status(302)
        end
    end
end