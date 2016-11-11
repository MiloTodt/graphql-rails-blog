Rails.application.routes.draw do
  root "application#index"
  post "/graphql", to: "graphql#create"

  ActiveAdmin.routes(self)
  devise_for :users

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  get '*all', to: 'application#index'
end
