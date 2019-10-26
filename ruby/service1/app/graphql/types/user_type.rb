module Types
    UserType = GraphQL::ObjectType.define do
        name "User"
        description "Representation of users"
        
        #data needed for querys
        field :idUsers, !types.Int
        field :userName, !types.String
        field :idClients, !types.Int
        field :clientName, !types[Types::ClientType] do
        #Sql query: join needed
            resolve -> (user, args, context) {
                Client.find_by_sql(
                    "SELECT clients.name, clients.lastName, clients.idProvinces
                    FROM users
                    JOIN clients ON users.idClients = clients.idClients
                    WHERE clients.idClients ="+user[:idClients].to_s
                )
            }
        end
    end
end