class CategoryBudget < ApplicationRecord
  belongs_to :budget
  belongs_to :category
end
