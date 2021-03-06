Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :users_xorders
  resources :users
  resources :restaurants_xorders
  resources :restaurants
  resources :provinces
  resources :orders
  resources :countries
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
