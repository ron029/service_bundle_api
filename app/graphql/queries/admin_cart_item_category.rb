module Queries
  class AdminCartItemCategory < AdminQueries
    graphql_name 'AdminCartItemCategory'
    type [Types::Models::CartItemType], null: false
    argument :status, Integer, required: false  # Change required to false

    def resolve(status: nil)
      # Check the user's role
      if current_user.admin?
        # If the user is an admin, no need to filter by service_id
        services = Service.where(user_id: current_user.id)
      elsif current_user.manager?
        # If the user is a manager, filter services by user_id
        services = Service.all
      else
        # Handle other roles as needed
        # You can add additional logic or raise an error if needed
        raise GraphQL::ExecutionError, "Unauthorized access"
      end

      # Find the cart items associated with those services
      cart_item_ids = services.pluck(:id)

      if status.nil?
        # If status is nil, select all except status "pending"
        CartItem.where(service_id: cart_item_ids)
                .where.not(status: 'pending')
      else
        # If status is specified, filter by the given status
        CartItem.where(service_id: cart_item_ids)
                .where(status: status)
      end
    end
  end
end
