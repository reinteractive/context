require 'spec_helper'

describe "context()" do
  before(:each) do
    @snippet=Context::Snippet.create!(:name => 'test', :body => 'I am a call to context!', :published => true)
  end

  context "without a block" do
    it "should return some content" do
      visit context_path
      page.body.should_not be_blank
      page.body.should =~ /I am a call to context!/
    end

    it "should correctly escape plain text content" do
      @snippet.update_attributes(:format => 'text/plain', :body => '<b>HTML <!-- Content --></b>')
      visit context_path
      page.body.should_not be_blank
      page.body.should =~ %r{&lt;b&gt;HTML &lt;!-- Content --&gt;&lt;/b&gt;}
    end

    it "should correctly escape HTML content" do
      html = '<b>HTML <!-- Content --></b>'
      @snippet.update_attributes(:format => 'text/html', :body => html)
      visit context_path
      page.body.should_not be_blank
      page.body.should =~ %r{#{html}}
    end
  end

  context "with a block" do
    it "should execute the contents of the block" do
      visit context_block_path
      page.body.should_not be_blank
      page.body.should =~ /<div class="name">test<\/div>/
      page.body.should =~ /I am a call to context!/
    end

    it "should return nothing if the snippet can't be found" do
      @snippet.destroy
      visit context_block_path
      page.body.should_not be_blank
      page.body.should_not =~ /<div class="name">test<\/div>/
      page.body.should_not =~ /I am a call to context!/
    end
  end
end
