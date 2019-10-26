module Types
    CountryType = GraphQL::ObjectType.define do
        name "Country"
        description "Representation of differents countries"
        
        #datos requeridos por las querys
        field :idCountries, !types.Int
        field :name, !types.String
    end
end