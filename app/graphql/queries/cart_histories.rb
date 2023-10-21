module Queries
  class CartHistories < AuthorisedQueries
    argument :id, ID, required: false

    type Types::Models::CartHistoryType, null: false

    def resolve(id: nil)
      cart_history = id.nil? ? nil : CartHistory.find_by(id: id)
      raise GraphQL::ExecutionError, 'CartHistory not found' if cart_history.nil?

      cart_history
    end
  end
end
