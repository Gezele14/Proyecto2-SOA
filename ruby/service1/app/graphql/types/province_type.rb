module Types
    ProvinceType = GraphQL::ObjectType.define do
        name "Province"
        description "Representation of different provinces of X country"
        
        #datos requeridos por las querys
        field :idProvinces, !types.Int
        field :name, !types.String
        field :idCountries, !types.Int
        field :countryName, !types[Types::CountryType] do
        #Sql query: join needed
        resolve -> (province, args, context) {
            Country.find_by_sql(
                "SELECT DISTINCT countries.name
                FROM provinces
                JOIN countries ON provinces.idCountries = countries.idCountries
                WHERE countries.idCountries ="+province[:idCountries].to_s
            )
        }    
        end
    end
end