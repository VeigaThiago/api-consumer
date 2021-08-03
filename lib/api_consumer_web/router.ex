defmodule ApiConsumerWeb.Router do
  use ApiConsumerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: ApiConsumer.Absinthe.Queries

    forward "/", Absinthe.Plug, schema: ApiConsumer.Absinthe.Queries
  end

  scope "/", ApiConsumerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ApiConsumerWeb do
  #   pipe_through :api
  # end
end
