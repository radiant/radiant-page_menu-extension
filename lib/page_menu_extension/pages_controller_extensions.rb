module PageMenuExtension::PagesControllerExtensions
  def self.included(base)
    base.class_eval {  
      def model_class
        Page.descendants.any?{|d| d.to_s == params[:page_class]} ? params[:page_class].constantize : Page
      end
    }
  end
end