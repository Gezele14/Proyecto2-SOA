module Mutations
    class UpdateUser < BaseMutation
        description "Update profile of a user, ONLY if is a client"

        #arguments needed
        argument :iduser, Int, required: true
        argument :username, String, required: true
        argument :password, String, required: true
        argument :idclient, Int, required: true
        
        # Type from the mutation
        type Types::UserType

        #update a user, (except idUser)
        def resolve(iduser: nil, username: nil, password: nil, idclient: nil)            
            User.update(iduser, userName: username, password: password, idClients: idclient)
        end
    end
end