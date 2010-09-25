require File.dirname(__FILE__) + "/../../spec_helper"

class ManufacturedPage < Page
  class << self
    private
    def default_page_parts(config = Radiant::Config)
      PagePart.new(:name => 'factory')
    end
  end
end

describe Admin::PagesController do
  dataset :users, :home_page

  before do
    login_as :existing
  end

  describe "#new" do
    it "should create page of given class" do
      get :new, :page_id => page_id(:home), :page_class => 'FileNotFoundPage'
      assigns(:page).class_name.should eql('FileNotFoundPage')
    end

    it "should rescue from a bogus page type when creating" do
      get :new, :page_id => page_id(:home), :page_class => 'BogusPage'
      assigns(:page).class_name.should be_nil
    end
    
    it "should instantiate a new page from the given class" do
      get :new, :page_id => page_id(:home), :page_class => 'ManufacturedPage'
      assigns(:page).parts.collect(&:name).should == ['factory']
    end
  end

end