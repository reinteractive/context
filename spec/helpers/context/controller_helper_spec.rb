require 'spec_helper'

class ControllerHelperTestController < Context::ApplicationController
  include Context::ControllerHelper
end

describe Context::ControllerHelper do
  describe "context_page" do
    before(:each) do
      @page=Context::Page.create!(:name      => 'Test Page', 
                                  :body      => 'I am a test page!',
                                  :slug      => 'test_page',
                                  :state     => "published")
      @controller=ControllerHelperTestController.new
    end

    it "should find the Page by a provided path" do
      @controller.context_page('test_page').should == @page
    end

    it "should only return published pages"

    it "should load the path from params[:path] if not provided" do
      @controller.should_receive(:params).and_return({ :path => 'test_page' })
      @controller.context_page().should == @page
    end
  end
end
