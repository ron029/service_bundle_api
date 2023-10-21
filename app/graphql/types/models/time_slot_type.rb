module Types
  module Models
    class TimeSlotType < Types::BaseObject
      field :id, ID, null: false
      field :service_id, Types::Models::ServiceType, null: false
      field :start_date, GraphQL::Types::ISO8601Date, null: true
      field :end_date, GraphQL::Types::ISO8601Date, null: true
      field :start_time, String, null: true
      field :end_time, String, null: true
      field :capacity, Integer, null: true
      field :duration, Integer, null: true
      field :interval, Integer, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

      def service_id
        object.service
      end
    end
  end
end
