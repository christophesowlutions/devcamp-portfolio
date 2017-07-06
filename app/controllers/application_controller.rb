class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist

  before_action :set_source

  def set_source
    session[:source] = params[:q] if params[:q] # Set q if and only if params exists
  end
end