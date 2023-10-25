module Mutations
  module CartItem
    class Delete < Mutations::AuthorisedMutation
      graphql_name 'DeleteCartItem'

      argument :id, ID, required: true

      field :errors, [String], null: true
      field :cart_item, Types::Models::CartItemType, null: true

      def resolve(params)
        cart_item = CartItems::Persistence.new(current_user).delete(params)
        {
          errors: cart_item[:errors],
          cart_item: cart_item[:service]
        }
      end
    end
  end
end
