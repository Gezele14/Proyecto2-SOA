module Mutations
    class CreateClient < BaseMutation
        description "Create the profile of a client"
        
        # arguments for client
        argument :identification, Int, required: true
        argument :name, String, required: true
        argument :lastname, String, required: true
        argument :address, String, required: true
        argument :email, String, required: true
        argument :phonenumber, Int, required: true
        argument :idprovinces, Int, required: true 
        
        # Type from the mutation
        type Types::ClientType

        #create a client, idClient is auto increment
        def resolve(identification: nil, name: nil, lastname: nil, address: nil, email: nil, phonenumber: nil, idprovinces: nil)            
            Client.create(identification: identification, name: name, lastName: lastname, address: address, email: email, phoneNumber: phonenumber, idProvinces: idprovinces)
        end
    end
end