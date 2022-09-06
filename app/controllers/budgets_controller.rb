class BudgetsController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        @budgets = CategoryBudget.includes(:category, :budget).where(category_id:@category).pluck('budgets.name','budgets.amount', 'budgets.created_at' )

    end

    def new
        @budget = Budget.new
        @categories = Category.all.pluck(:name, :id)
    end

    def create
        @budget = current_user.budgets.build(budget_params)
        @category = Category.find(params[:category_id])
        @category_budget = CategoryBudget.new(category_id: @category.id, budget_id: @budget.id)
        respond_to do |format|
            format.html do
                if @budget.save && @category_budget.save
                    flash[:success] = 'Budget was successfully created.'
                    redirect_to '/categories'
                else
                    flash.now[:danger] = 'Budget was not created.'
                    render :new
                end
            end
        end
    end

    private

    def budget_params
        params.require(:budget).permit(:name, :amount)
    end
end
