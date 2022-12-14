class Budget < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 },
                     format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  belongs_to :user, class_name: 'User', optional: true
  has_many :category_budgets, dependent: :destroy
  has_many :categories, through: :category_budgets, dependent: :destroy
end
