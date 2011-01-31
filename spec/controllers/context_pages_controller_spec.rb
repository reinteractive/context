require 'spec_helper'

describe Context::PagesController do

  def mock_page(stubs={})
    (@mock_page ||= mock_model(Page).as_null_object).tap do |page|
      page.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET show" do
    it "assigns the page when it is found by slug" do
      page=mock_page(:title => 'Foo/Bar Page')
      Pages.should_receive(:find_by_slug).with('foo/bar').and_return(page)
      get :show, :page => 'foo/bar'
      assigns(:page).should eq(page)
    end

    it "renders the 404 page when Page can't be found" do
      Page.should_receive(:find_by_slug).with('foo/bar').and_return(nil)
      get :show, :page => 'foo/bar'
      response.should render_template("404")
    end
  end
end
