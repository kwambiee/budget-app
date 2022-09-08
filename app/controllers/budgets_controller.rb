class BudgetsController < ApplicationController
  def new
    @budget = Budget.new
    @categories = Category.all
  end

  def create
    @categories = current_user.categories
    params = budget_params
    @budget = Budget.new(name: params[:name], amount: params[:amount])
    @budget.user = current_user

    if @budget.save
      @category = Category.find(params[:category_id])
      @category.budgets << @budget
      redirect_to category_path(params[:category_id]), notice: 'Budget was successfully created.'
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
