class BudgetsController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        @budgets = CategoryBudget.includes(:category, :budget).where(category: @category).order('budgets.created_at DESC').pluck('budgets.name','budgets.amount', 'budgets.created_at' )
    end

    def new
        @budget = Budget.new
        @categories = Category.all
    end

    def create
        @categories = current_user.categories
        params = budget_params
        @budget = Budget.new(name: params[:name], amount: params[:amount], user: current_user)

        if @budget.save
            @category_budget = CategoryBudget.new(category_id: params[:category_id], budget_id: @budget.id)
            redirect_to category_budgets_path(params[:category_id]), notice: 'Budget was successfully created.'
        else
            flash[:danger] = 'Budget was not created.'
            render :new, status: :unprocessable_entity
        end
    end

    private

    def budget_params
        params.permit(:name, :amount, :category_id)
    end
end
