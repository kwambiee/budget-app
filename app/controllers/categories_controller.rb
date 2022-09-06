class CategoriesController < ApplicationController
  def index
    all_categories
  end


  def all_categories
        @categories = CategoryBudget.includes(:budget, :category).pluck('categories.name', 'categories.icon', 'budgets.amount','categories.id')

    @results = {}

    @categories.each do |category|
      if @results[category[0]]
        amount = @results[category[0]]["amount"] + category[2]
        @results[category[0]]={'icon' => category[1], 'amount' => amount, 'id' => category[3]}
      else
        @results[category[0]]={'icon' => category[1], 'amount' => category[2], 'id' => category[3]}
      end
    end

  end

  def show
    @category = Category.find(params[:id])
    @budgets = CategoryBudget.includes(:category, :budget).where(category_id:@category).order('budgets.created_at DESC').pluck('budgets.name','budgets.amount', 'budgets.created_at' )
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    respond_to do |format|
      format.html do
        if @category.save
          flash[:success] = 'Category was successfully created.'
          redirect_to '/categories'
        else
          flash.now[:danger] = 'Category was not created.'
          render :new
        end
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end

