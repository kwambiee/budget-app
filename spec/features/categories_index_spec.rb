require 'rails_helper'

RSpec.feature 'Category Page' do
  feature 'shows all categories' do
    background do
      visit new_user_session_path
      @first = User.create(name: 'kwamboka', email: 'kwambokaj1@gmail.com', password: 'kwamboka')
      @category_one = Category.create(name: 'Fruity', icon: 'fruits.png', user_id: @first.id)
      @budget_one = Budget.create(name: 'Mango', amount: 100, user_id: @first.id)

      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password

      click_button 'Log in'

      visit categories_path
    end


    scenario 'shows each category' do
        expect(page).to have_content('Fruity')
        expect(page).to have_content('Add category')
    end
    scenario 'Shows category title' do
        expect(page).to have_content('Welcome!')
        expect(page).to have_content('Track your Expenditure')
    end
  end
end
