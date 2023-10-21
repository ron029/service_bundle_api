module Types
  module Models
    class CartItemTallyType < Types::BaseObject
      field :date, GraphQL::Types::ISO8601Date, null: true
      field :count, Integer, null: true
    end
  end
end
