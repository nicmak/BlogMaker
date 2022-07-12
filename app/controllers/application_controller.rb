class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist

  before_action :set_session

  def set_session
    session[:source] = params[:q]
  end
end
