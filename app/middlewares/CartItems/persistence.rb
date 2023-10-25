module CartItems
  class Persistence
    attr_reader :current_user, :errors, :cart_item

    def initialize(current_user = nil)
      @errors = ActiveModel::Errors.new(self)
      @current_user = current_user
    end

    def create(params)
      current_user_cart = current_user.carts.where(status: 'pending').first # Use .first to get the first matching cart
      cart_id = if !current_user_cart
                  cart = Cart.create(user_id: current_user.id, status: 0)
                  cart.id
                else
                  current_user_cart.id
                end
      c = CartItem.new(
        cart_id: cart_id, service_id: params[:service_id],
        date: params[:date], time: params[:time], status: 0
      )
      errors = c.save ? [] : c.errors.full_messages
      { errors: errors, cart_item: c }
    end

    def update(params)
      cart_item = CartItem.find(params[:id])
      cart_item.update_column('status', params[:status])
      cart_item
    end

    def delete(params)
      cart_item = CartItem.find_by(id: params[:id])
      cart_item.destroy
      { errors: errors, cart_item: cart_item }
    end

    def create_cart
       # Return the cart object, not its id
    end
  end
end
