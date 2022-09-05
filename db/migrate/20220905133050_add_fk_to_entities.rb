class AddFkToEntities < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :group, index:true
  end
end
