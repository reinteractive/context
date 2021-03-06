  require 'spec_helper'

describe Context::Page do
  
  context "URL prefixing" do
    it "prefixes with / if not already" do
      Context::Page.prefix_slash("page").should eql("/page")
    end
    
    it "doesn't prefix if slash already prefixes" do
      Context::Page.prefix_slash("/page").should eql("/page")
    end
  end

  it "should require a name" do
    page = Context::Page.new
    page.valid?.should be_false
    page.errors["name"].any?.should be_true
  end

  it "should generate a slug it's name if left blank" do
    @page=Context::Page.create!(:name => 'Test Page', :body => 'I am a test page!', :slug => nil)
    @page.slug.should == 'test-page'
    @page.context_path.should == '/test-page'
  end

  it "should provide a .published and .draft scope" do
    published     = Context::Page.create!(:name => "Published", :state => "published")
    draft         = Context::Page.create!(:name => "Draft", :state => "draft")
    
    published_pages = Context::Page.published
    published_pages.should include(published)
    published_pages.should_not include(draft)
    
    draft_pages = Context::Page.draft
    draft_pages.should_not include(published)
    draft_pages.should include(draft)
  end

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

    describe ".context_path" do
      it "should include the slug" do
        @page.context_path.should == "/#{@page.slug}"
      end

      it "should include the slugs of the parents" do
        parent=Context::Page.create!(:name => "Another Page", :body => "I am another page!", :slug => 'another_page', :parent => @page)
        child=Context::Page.create!(:name => "Yet Another Page", :body => "I am yet another page!", :slug => 'yet_another_page', :parent => parent)
        child.context_path.should == "/#{@page.slug}/#{parent.slug}/#{child.slug}"
      end

      it "should be updated when the slug changes" do
        old_path=@page.context_path
        @page.update_attributes(:slug => 'new-slug-test-page')
        @page.context_path.should_not == old_path
        @page.context_path.should == "/new-slug-test-page"
      end

      it "should be updated when any parent slugs change" do
        parent=Context::Page.create!(:name => "Another Page", :body => "I am another page!", :slug => 'another_page', :parent => @page)
        child=Context::Page.create!(:name => "Yet Another Page", :body => "I am yet another page!", :slug => 'yet_another_page', :parent => parent)
        old_path=child.context_path
        @page.reload
        @page.update_attributes(:slug => 'new-parent-slug')
        child.reload
        child.context_path.should_not == old_path
        child.context_path.should == "/new-parent-slug/#{parent.slug}/#{child.slug}"
      end
    end
  end
end
