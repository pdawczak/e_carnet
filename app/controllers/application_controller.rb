class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  attr_reader :app
  helper_method :app, :current_user

  before_filter :setup_app

  def current_user
    app.current_user
  end

  private

  def setup_app
    @app = ECarnetApp.for_user_by_id(session[:user_id])
  end
end
