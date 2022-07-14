module SetSource
  extend ActiveSupport::Concern
  
  included do
    before_filter :set_session
  end

  def set_session
    session[:source] = params[:q]
  end
end