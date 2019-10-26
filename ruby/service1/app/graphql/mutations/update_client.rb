module Mutations
    class UpdateClient < BaseMutation
        description "Update profile of a client"

        #arguments needed
        argument :idclient, Int, required: true
        argument :identification, Int, required: true
        argument :name, String, required: true
        argument :lastname, String, required: true
        argument :address, String, required: true
        argument :email, String, required: true
        argument :phonenumber, Int, required: true
        argument :idprovinces, Int, required: true 
        
        # Type from the mutation
        type Types::ClientType

        #update a client (except idClient)
        def resolve(idclient: nil, identification: nil, name: nil, lastname: nil, address: nil, email: nil, phonenumber: nil, idprovinces: nil)            
            Client.update(idclient, identification: identification, name: name, lastName: lastname, address: address, email: email, phoneNumber: phonenumber, idProvinces: idprovinces)
        end
    end
end