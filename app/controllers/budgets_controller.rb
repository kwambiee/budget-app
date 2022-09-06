class BudgetsController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        @budgets = CategoryBudget.includes(:category, :budget).where(category_id:@category).pluck('budgets.name','budgets.amount', 'budgets.created_at' )

    end
end
