require 'spec_helper'

describe "context()" do
  before(:each) do
    @snippet=Snippet.create!(:name => 'test', :body => 'I am a call to context!')
  end

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
    @snippet.update_attributes(:format => 'text/html', :body => '<b>HTML <!-- Content --></b>')
    visit context_path
    page.body.should_not be_blank
    page.body.should =~ %r{<b>HTML <!-- Content --></b>}
  end
end
