require 'spec_helper'

describe Context::PagesController do

  describe "GET show" do
    it "assigns the page when it is found by path" do
      page=Context::Page.create(:name => 'Foo/Bar Page')
      Context::Page.should_receive(:locate).with('foo/bar').and_return(page)
      get :show, :path => 'foo/bar'
      assigns(:page).should eq(page)
    end

    it "raises a common 404 exception when the Page can't be found" do
      Context::Page.should_receive(:locate).with('foo/bar').and_return(nil)
      lambda {
        get :show, :path => 'foo/bar'
      }.should raise_exception(AbstractController::ActionNotFound)
    end
  end
end
