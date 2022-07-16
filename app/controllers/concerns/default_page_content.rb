module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end 

  def set_page_defaults
    @page_title = "Nick's Blog Dynamic"
    @seo_keywords = "Nick, SEO, Stuff"
  end
end