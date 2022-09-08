class CategoriesController < ApplicationController
  def index
    @categories = Category.all.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
    @budgets = @category.budgets
    @total_amount = @budgets.sum(&:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    respond_to do |format|
      format.html do
        if @category.save
          redirect_to '/categories', notice: 'Category was successfully created.'

        else
          flash[:danger] = 'Category was not created.'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
