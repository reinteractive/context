require 'spec_helper'

describe Context::Snippet do

  it "should require a name"
  it "should require a slug"
  it "should generate a slug from the parent's slug and it's name if left blank"

  context "instance" do
    before(:each) do
      @page=Context::Page.create!(:name => 'Test Page', :body => 'I am a test page!', :slug => 'test_page')
    end

    describe ".layout" do
      it "should return true by default" do
        @page.should respond_to(:layout)
        @page.layout.should === true
      end
    end
  end

end

