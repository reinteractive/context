require 'spec_helper'

describe "context_tag()" do
  before(:all) do
    Snippet.create!(:name => 'test', :body => 'I am a call to context!')
  end

  it "should return some content" do
    visit context_tag_path
    page.body.should_not be_blank
    page.body.should =~ /div/
    page.body.should =~ /I am a call to context!/
  end
end
