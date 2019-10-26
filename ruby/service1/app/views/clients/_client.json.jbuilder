json.extract! client, :id, :identification, :name, :lastName, :address, :email, :phoneNumber, :idProvinces, :created_at, :updated_at
json.url client_url(client, format: :json)
