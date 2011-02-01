require 'spec_helper'

describe "Pages" do
  before(:each) do
    @page=Context::Page.create!(:name => 'Test Page', :body => 'I am a test page!', :slug => 'test_page')
  end

  it "should render correctly from the slug" do
    visit "/test_page"
    page.body.should_not be_blank
    # Make sure we are in the application layout
    page.body.should =~ /Context Test Layout/
    page.body.should =~ /I am a test page!/
  end

  it "should render with a custom layout if set by the subclass" do
    @page.should_receive(:layout).and_return('custom')
    Context::Page.should_receive(:find_by_path).with('test_page').and_return(@page)
    visit "/test_page"
    page.body.should_not be_blank
    # Make sure we are in the custom layout
    page.body.should =~ /Custom Layout/
    page.body.should_not =~ /Context Test Layout/
    page.body.should =~ /I am a test page!/
  end

  it "should render a 404 when there Page can't be found" do
    visit "/a_missing_test_page"
    page.body.should_not be_blank
    # Make sure we are in the application layout
    page.body.should =~ /Context Test Layout/
    page.body.should =~ /doesn't exist any more/
  end
end
