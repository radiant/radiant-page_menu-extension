module PageMenuExtension::PagesControllerExtensions
  def self.included(base)
    base.alias_method_chain :new, :page_menu
  end
  
  def new_with_page_menu
    if Page.descendants.any?{|d| d.name == params[:page_class]}
      self.model = params[:page_class].constantize.new_with_defaults
    end
    new_without_page_menu
  end
end