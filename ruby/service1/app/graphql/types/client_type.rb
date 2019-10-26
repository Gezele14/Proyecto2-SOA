module Types
    ClientType = GraphQL::ObjectType.define do
        name "Client"
        description "Representation of clients"

        #data needed for querys
        field :idClient, !types.Int
        field :identification, !types.Int
        field :name, !types.String
        field :lastName, !types.String
        field :email, !types.String
        field :phoneNumber, !types.Int
        field :idProvinces, !types.Int
        field :province, !types[Types::ProvinceType] do  
        #Sql query: join needed
            resolve -> (client, args, context) {
                Province.find_by_sql(
                    "SELECT DISTINCT provinces.name, provinces.idCountries 
                    FROM clients 
                    JOIN provinces ON clients.idProvinces = provinces.idProvinces
                    WHERE provinces.idProvinces ="+client[:idProvinces].to_s
                )
            }
        end
    end
end