module Types

  # All mutations needed
  # Don't forget: no delete!
  class MutationType < Types::BaseObject
    field :create_client, mutation: Mutations::CreateClient
    field :create_user, mutation: Mutations::CreateUser
    field :update_client, mutation: Mutations::UpdateClient
    field :update_user, mutation: Mutations::UpdateUser
  end
end
