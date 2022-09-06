class EntitiesController < ApplicationController
    def index
        @group = Group.find(params[:group_id])
        @entities = EntityGroup.joins(:group, :entity).where(group_id:@group).pluck('entities.name','entities.amount', 'entities.created_at' )

    end
end
