module PageMenuExtension::PagesControllerExtensions
  def self.included(base)
    base.alias_method_chain :assign_page_attributes, :page_menu
  end

  def assign_page_attributes_with_page_menu
    if params[:page_class] && params[:page_class].constantize <= Page
      self.model.class_name = params[:page_class]
    end
  rescue NameError => e
    logger.warn "Wrong page class given in Pages#new: #{e.message}"
  ensure
    assign_page_attributes_without_page_menu
  end
end