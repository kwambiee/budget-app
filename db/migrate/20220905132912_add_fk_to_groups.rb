class AddFkToGroups < ActiveRecord::Migration[7.0]
  def change
   add_reference :groups, :entity, index: true
  end
end
