module Types
  module Models
    class CartHistoryType < Types::BaseObject
      field :id, ID, null: false
      field :cart, Types::Models::CartType, null: false
      field :payment_option, Types::Models::PaymentOptionType, null: false
      field :first_name, String, null: true
      field :last_name, String, null: true
      field :contact_number, String, null: true
      field :email, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :cart_item, [Types::Models::CartItemType], null: true
      field :user, Types::Models::UserType, null: false
      field :status, Boolean, null: false

      def cart
        object.cart
      end

      def cart_item
        cart = object.cart
        cart.cart_items
      end

      def payment_option
        object.payment_option
      end

      def user
        User.find_by_id(context[:current_user].id)
      end

      def status
        current_user_id = User.find_by_id(context[:current_user].id).id
        cart_user_id = object.cart.user_id
        cart_user_id == current_user_id
      end
    end
  end
end
