class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :icon, presence: true

  belongs_to :user, class_name: 'User', optional: true
  has_many :budgets, through: :category_budgets, dependent: :destroy
end
