module Mutations
    #Parent of all mutations, don't forget
    class BaseMutation < GraphQL::Schema::Mutation
        null false
    end
end