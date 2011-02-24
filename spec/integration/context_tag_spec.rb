require 'spec_helper'

describe "context_tag()" do
  before(:each) do
    @snippet=Context::Snippet.create!(:name => 'test', 
                                      :body => 'I am a call to context!',
                                      :state => 'published')
  end

  it "should return some content" do
    visit context_tag_path
    page.body.should_not be_blank
    page.body.should =~ /div/
    page.body.should =~ /I am a call to context!/
  end

  it "should correctly escape plain text content" do
    @snippet.update_attributes(:format => 'text/plain', :body => '<b>HTML <!-- Content --></b>')
    visit context_tag_path
    page.body.should_not be_blank
    page.body.should =~ %r{<div>&lt;b&gt;HTML &lt;!-- Content --&gt;&lt;/b&gt;</div>}
  end

  it "should correctly escape HTML content" do
    @snippet.update_attributes(:format => 'text/html', :body => '<b>HTML <!-- Content --></b>')
    visit context_tag_path
    page.body.should_not be_blank
    page.body.should =~ %r{<div><b>HTML <!-- Content --></b></div>}
  end
end
