require 'spec_helper'

describe "Pages" do
  before(:each) do
    @page=Context::Page.create!(:name      => 'Test Page', 
                                :body      => 'I am a test page!',
                                :state     => 'published')
  end

  it "should render correctly from the slug" do
    visit "/test-page"
    page.body.should_not be_blank
    # Make sure we are in the application layout
    page.body.should =~ /Context Test Layout/
    page.body.should =~ /I am a test page!/
  end

  it "should render with a custom layout if set by the subclass" do
    @page.should_receive(:layout).and_return('custom')
    Context::Page.should_receive(:locate).with('test-page').and_return(@page)
    visit "test-page"
    page.body.should_not be_blank
    # Make sure we are in the custom layout
    page.body.should =~ /Custom Layout/
    page.body.should_not =~ /Context Test Layout/
    page.body.should =~ /I am a test page!/
  end

  it "should raise the normal 404 when the Page can't be found" do
    lambda {
      visit "/a_missing_test_page"
    }.should raise_exception(AbstractController::ActionNotFound)
  end
  
  it "should raise the normal 404 when the page is not published" do
    @page.update_attribute(:state, 'draft')
    @page.save
    lambda {
      visit @page.context_path
    }.should raise_exception(AbstractController::ActionNotFound)
  end

  it "should use Context::Configuration.page_show_template_path to render a different view template" do
    Context::Configuration.should_receive(:page_show_template_path).twice.and_return(File.join(Rails.root, 'app', 'views', 'test', 'custom_show.html.erb'))
    visit "/test-page"
    page.body.should =~ /CUSTOM VIEW TEMPLATE/
  end
  
  it "generates the correct path" do
    @page.context_path.should eql("/test-page")
  end
  
  it "allows for custom page paths" do
    @page = Context::Page.create!(:name => 'Test Page', 
                                  :body => 'I am a test page!', 
                                  :slug => 'not-so-sluggish')
    @page.context_path.should eql("/not-so-sluggish")
  end
end
