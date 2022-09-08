class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :budgets, dependent: :destroy
  has_many :categories, dependent: :destroy
end
