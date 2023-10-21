module Queries
  class CartItemCategory < AuthorisedQueries
    graphql_name 'CartItemCategory'
    type [Types::Models::CartItemType], null: false
    argument :status, Integer, required: false  # Change required to false

    def resolve(status: nil)
      cart_items_query = CartItem.where(cart_id: Cart.where(user_id: current_user.id).pluck(:id))

      if status.present?  # Check if status is not nil
        cart_items_query = cart_items_query.where(status: status)
      end

      cart_items_query
    end
  end
end