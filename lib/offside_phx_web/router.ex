defmodule OffsidePhxWeb.Router do
  use OffsidePhxWeb, :router

  import OffsidePhxWeb.AdminAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {OffsidePhxWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_admin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OffsidePhxWeb do
    pipe_through :browser

    resources "/tags", TagController, only: [:show]
  end

  scope "/", OffsidePhxWeb do
    pipe_through :browser

    live "/", PostLive
    live "/post_live/:id", PostShowLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", OffsidePhxWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: OffsidePhxWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", OffsidePhxWeb do
    pipe_through [:browser, :redirect_if_admin_is_authenticated]

    get "/admins/register", AdminRegistrationController, :new
    post "/admins/register", AdminRegistrationController, :create
    get "/admins/log_in", AdminSessionController, :new
    post "/admins/log_in", AdminSessionController, :create
    get "/admins/reset_password", AdminResetPasswordController, :new
    post "/admins/reset_password", AdminResetPasswordController, :create
    get "/admins/reset_password/:token", AdminResetPasswordController, :edit
    put "/admins/reset_password/:token", AdminResetPasswordController, :update
  end

  scope "/", OffsidePhxWeb do
    pipe_through [:browser, :require_authenticated_admin]

    resources "/posts", PostController, except: [:index, :show]
    resources "/tags", TagController, except: [:show]
    get "/admin", PageController, :admin

    get "/admins/settings", AdminSettingsController, :edit
    put "/admins/settings", AdminSettingsController, :update
    get "/admins/settings/confirm_email/:token", AdminSettingsController, :confirm_email
  end

  scope "/", OffsidePhxWeb do
    pipe_through [:browser]

    delete "/admins/log_out", AdminSessionController, :delete
    get "/admins/confirm", AdminConfirmationController, :new
    post "/admins/confirm", AdminConfirmationController, :create
    get "/admins/confirm/:token", AdminConfirmationController, :edit
    post "/admins/confirm/:token", AdminConfirmationController, :update
  end
end
