class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :cart_history, dependent: :destroy
  # belongs_to :cart_history, foreign_key: 'cart_history_id'

  enum status: { pending: 0, completed: 1 }
end
