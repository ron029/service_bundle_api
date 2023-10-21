module Mutations
  module TimeSlot
    class Update < AdminMutation
      graphql_name 'UpdateTimeSlot'

      argument :id, ID, required: true
      argument :service_id, ID, required: true
      argument :start_date, String, required: true
      argument :end_date, String, required: true
      argument :start_time, String, required: true
      argument :end_time, String, required: true
      argument :capacity, Integer, required: false
      argument :duration, Integer, required: false
      argument :interval, Integer, required: false

      field :errors, [String], null: true
      field :time_slot, Types::Models::TimeSlotType, null: true
      def resolve(params)
        time_slot = TimeSlots::Persistence.new(current_user).update(params)
        {
          errors: time_slot.errors.full_messages,
          time_slot: time_slot
        }
      end
    end
  end
end
