module Types
  class QueryType < Types::BaseObject

    #Query Graphql: select * from clients 
    #with join: province name of each client
    field :clients, [Types::ClientType], null: false,
      description: "All the clients of the restaurants"
    def clients
      Client.all
    end

    #Query Graphql: select * from users 
    #with join: real name of each user
    field :users, [Types::UserType], null: false,
      description: "All the users of the restaurants"
    def users
      User.all
    end

    #Query Graphql: select * from provinces 
    #with join: name of the country of each province
    field :places, [Types::ProvinceType], null: false,
      description: "Provinces of differents countries which have a restaurant"
    def places
      Province.all
    end

    #Query Graphql: select a client by id
    field :search_client, Types::ClientType, 
      description:"Search a client by his id, the id is a number", null: false do 
      argument :id, ID, required: true
    end
    def search_client(id:)
      Client.find(id)
    end

    #Query Graphql: select a user by id
    field :search_user, Types::UserType, 
      description:"Search a user by his id, the id is a number", null: false do 
      argument :id, ID, required: true
    end
    def search_user(id:)
      User.find(id)
    end
  end
end
