require "spec_helper"

describe Context::PagesController do
  describe "routing" do
    it "recognizes the any slug" do
      { :get => '/foo' }.should route_to(:controller => 'context/pages', :action => 'show', :path => 'foo')
    end
    it "recognizes nested slugs" do
      { :get => '/foo/bar' }.should route_to(:controller => 'context/pages', :action => 'show', :path => 'foo/bar')
    end
  end
end
