module Mutations
    class CreateUser < BaseMutation
        description "Create the profile of a user ONLY if is a client"
        
        # arguments for users
        # not mayus (don't forget)
        argument :username, String, required: true
        argument :password, String, required: true
        argument :idclient, Int, required: true
        
        # Type from the mutation
        type Types::UserType

        #create a user, idUser is auto increment
        def resolve(username: nil, password: nil, idclient: nil)            
            User.create(userName: username, password: password, idClients: idclient)
        end
    end
end