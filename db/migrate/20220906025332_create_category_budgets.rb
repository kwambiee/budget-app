class CreateCategoryBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :category_budgets do |t|
      t.references :category, foreign_key: {to_table: :categories }
      t.references :budget, foreign_key: {to_table: :budgets }

      t.timestamps
    end
  end
end
