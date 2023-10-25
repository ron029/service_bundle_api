module Mutations
  module Service
    class Update < Mutations::AuthorisedMutation
      graphql_name 'UpdateService'

      argument :id, ID, required: true
      argument :service_category_id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: true
      argument :price, Integer, required: true
      argument :image, String, required: true

      field :errors, [String], null: true
      field :service, Types::Models::ServiceType, null: true

      def resolve(params)
        service = Services::Persistence.new(current_user).update(params)
          {
            errors: !service.nil? ? [] : service.errors.full_messages,
            service: service
          }
      end
    end
  end
end
