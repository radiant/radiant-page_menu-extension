require_dependency 'application_controller'

class PageMenuExtension < Radiant::Extension
  version "0.2"
  description "Adds a page-type select menu"
  url "http://github.com/radiant/radiant"
  
  def activate
    Admin::PagesController.send :include, PagesControllerExtensions
    Admin::PagesController.helper :page_menu
    Page.send :include, PageExtensions
    admin.page.edit.layout.delete 'edit_type'
  end
end
