require 'rails_helper'

RSpec.feature 'Budgets Index Page' do
  feature 'shows all budgets' do
    background do
      visit new_user_session_path
      @first = User.create(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')
      @category_one = Category.create(name: 'Fruity', icon: 'fruits.png', user_id: @first.id)
      @budget_one = Budget.create(name: 'Hotdog', amount: 5.00, user_id: @first.id)

      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password

      click_button 'Log in'

      visit category_budgets_path(@category_one.id)
    end

    scenario 'shows all budgets' do
      expect(page).to have_content('Add transaction')
      expect(page).to have_content('Total Expenditure')
    end
  end
end
