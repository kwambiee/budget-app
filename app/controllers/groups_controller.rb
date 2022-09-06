class GroupsController < ApplicationController
  def index
    categories = EntityGroup.joins(:entity, :group).pluck('groups.name', 'groups.icon', 'entities.amount')
    categories = categories.group_by { |name| [name[0], name[1]] }.transform_values do |value|
      value.map do |val|
        val[2]
      end.sum
    end
    @category = categories.reduce([]) do |category, (cat_name, cat_amount)|
      category << { name: cat_name[0], icon: cat_name[1], amount: cat_amount }
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    respond_to do |format|
      format.html do
        if @group.save
          flash[:success] = 'Group was successfully created.'
          redirect_to '/groups'
        else
          flash.now[:danger] = 'Group was not created.'
          render :new, locals: { group: @group }
        end
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
