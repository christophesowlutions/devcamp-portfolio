module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Default Portfolio Tite"
    @seo_keywords = "Badi3 Mabdou3 Portfolio"
  end
end
