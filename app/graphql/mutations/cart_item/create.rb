module Mutations
  module CartItem
    class Create < Mutations::AuthorisedMutation
      graphql_name 'CreateCartItem'

      argument :service_id, ID, required: true
      argument :date, String, required: true
      argument :time, String, required: true

      field :errors, [String], null: true
      field :cart_item, Types::Models::CartItemType, null: true

      def resolve(params)
        cart_item = CartItems::Persistence.new(current_user).create(params)
        {
          errors: cart_item[:errors],
          cart_item: cart_item[:service]
        }
      end
    end
  end
end
