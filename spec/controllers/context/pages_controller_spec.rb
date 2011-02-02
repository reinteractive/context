require 'spec_helper'

describe Context::PagesController do

  def mock_page(stubs={})
    (@mock_page ||= mock_model(Context::Page).as_null_object).tap do |page|
      page.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET show" do
    it "assigns the page when it is found by path" do
      page=Context::Page.create(:name => 'Foo/Bar Page')
      Context::Page.should_receive(:find_by_path).with('foo/bar').and_return(page)
      get :show, :path => 'foo/bar'
      assigns(:page).should eq(page)
    end

    it "raises a common 404 exception when the Page can't be found" do
      Context::Page.should_receive(:find_by_path).with('foo/bar').and_return(nil)
      lambda {
        get :show, :path => 'foo/bar'
      }.should raise_exception(AbstractController::ActionNotFound)
    end

    it "should only render published pages"
  end
end
