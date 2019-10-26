json.extract! user, :id, :userName, :password, :idClients, :created_at, :updated_at
json.url user_url(user, format: :json)
