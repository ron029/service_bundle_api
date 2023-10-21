module Types
  module Models
    class CartItemType < Types::BaseObject
      field :id, ID, null: false
      field :cart, Types::Models::CartType, null: false
      field :user, Types::Models::UserType, null: true
      field :service, Types::Models::ServiceType, null: false
      field :date, String, null: true
      field :time, String, null: true
      field :status, String, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
      field :service_name, String, null: true
      field :user_name, String, null: true
      field :user_lastname, String, null: true
      field :cart_history, Types::Models::CartHistoryType, null: true
      # field :service_category, Types::Models::ServiceCategoryType, null: true

      def cart_history
        object.cart.cart_history[0]
      end

      def cart
        object.cart
      end

      def user
        object.cart.user
      end

      def service
        object.service
      end
    end
  end
end
