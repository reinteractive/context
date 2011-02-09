require 'spec_helper'

describe Context::Page do

  it "should require a name"

  it "should generate a slug it's name if left blank" do
    @page=Context::Page.create!(:name => 'Test Page', :body => 'I am a test page!', :slug => nil)
    @page.slug.should == 'test-page'
    @page.path.should == 'test-page'
  end

  it "should provide a .published scope" do
    page =
    Context::Page.published  
  end
  
  it "should provide a .draft scope"

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

    describe ".path" do
      it "should include the slug" do
        @page.path.should == "#{@page.slug}"
      end

      it "should include the slugs of the parents" do
        parent=Context::Page.create!(:name => "Another Page", :body => "I am another page!", :slug => 'another_page', :parent => @page)
        child=Context::Page.create!(:name => "Yet Another Page", :body => "I am yet another page!", :slug => 'yet_another_page', :parent => parent)
        child.path.should == "#{@page.slug}/#{parent.slug}/#{child.slug}"
      end

      it "should be updated when the slug changes" do
        old_path=@page.path
        @page.update_attributes(:slug => 'new-slug-test-page')
        @page.path.should_not == old_path
        @page.path.should == "new-slug-test-page"
      end

      it "should be updated when any parent slugs change" do
        parent=Context::Page.create!(:name => "Another Page", :body => "I am another page!", :slug => 'another_page', :parent => @page)
        child=Context::Page.create!(:name => "Yet Another Page", :body => "I am yet another page!", :slug => 'yet_another_page', :parent => parent)
        old_path=child.path
        @page.reload
        @page.update_attributes(:slug => 'new-parent-slug')
        child.reload
        child.path.should_not == old_path
        child.path.should == "new-parent-slug/#{parent.slug}/#{child.slug}"
      end
    end
  end
end
