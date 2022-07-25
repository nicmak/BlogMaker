module SetSource
  extend ActiveSupport::Concern
  
  included do
    before_action :set_session
  end

  def set_session
    session[:source] = params[:q]
  end
end