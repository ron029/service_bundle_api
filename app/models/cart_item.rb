class CartItem < ApplicationRecord
  validate :check_time_slot_capacity

  belongs_to :cart
  belongs_to :service

  validates_date :date, on_or_after: :today, on_or_after_message: 'must be today or a future date'
  validates :status, :date, :time, presence: true

  enum status: { pending: 0, paid: 1, confirmed: 2, cancelled: 3, completed: 4 }

  private

  def check_time_slot_capacity
    return unless date.present? && time.present?

    service = self.service
    # Find the time slot where the input date falls within the range
    time_slot = service.time_slots.find do |ts|
      date >= ts.start_date && date <= ts.end_date
    end

    # Check the date if fully booked
    cart_items_count = CartItem.where(date: date, service_id: service.id).where.not(status: [0, 3]).count
    if time_slot.capacity.present? && time_slot.capacity != 0 && cart_items_count >= time_slot.capacity
      errors.add(:base, 'We\'re fully booked for this date. Please pick an alternative date.')
      return
    end

    # Check if timeslot has been taken
    same_time = CartItem.where(service_id: service_id, date: date, time: time).where.not(status: [0, 3]).count
    if same_time >= 1 && time_slot.duration.present?
      errors.add(:base, 'Sorry, this time slot is no longer available as it\'s already booked.')
      return
    end

    same_time_cart = CartItem.where(cart_id: cart_id,
                                    service_id: service_id, date: date, status: status, time: time).count
    if same_time_cart >= 1 && time_slot.duration.present?
      errors.add(:base, 'You\'ve already added this time slot to your cart.')
      return
    end

    # Check if capacity exceeds when we add more items to the cart.
    pending_count = CartItem.where(cart_id: cart_id, service_id: service_id, date: date, status: status).count
    return unless time_slot.capacity != 0 && pending_count + cart_items_count >= time_slot.capacity

    errors.add(:base, 'You can proceed with your current selections, but no more items can be added for this date.')
  end
end
