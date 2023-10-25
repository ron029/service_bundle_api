module Types
  class MutationType < Types::BaseObject
    # TODO: remove me

    field :delete_time_slot, mutation: Mutations::TimeSlot::Delete
    field :create_time_slot, mutation: Mutations::TimeSlot::Create
    field :update_time_slot, mutation: Mutations::TimeSlot::Update
    field :delete_service_category, mutation: Mutations::ServiceCategory::Delete
    field :create_service_category, mutation: Mutations::ServiceCategory::Create
    field :update_service_category, mutation: Mutations::ServiceCategory::Update
    field :create_service, mutation: Mutations::Service::Create
    field :update_service, mutation: Mutations::Service::Update
    field :create_cart_history, mutation: Mutations::CartHistory::Create
    field :update_status_admin_cart_item, mutation: Mutations::CartItem::UpdateStatusAdmin
    field :create_cart_item, mutation: Mutations::CartItem::Create
    field :delete_cart_item, mutation: Mutations::CartItem::Delete
    field :create_user, mutation: Mutations::User::Create
    field :update_user, mutation: Mutations::User::Update
    field :delete_user, mutation: Mutations::User::Delete
    field :email_exists, mutation: Mutations::User::CheckEmail
    field :login, mutation: Mutations::Session::Login

    field :test_field, String, null: false, description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end
  end
end
