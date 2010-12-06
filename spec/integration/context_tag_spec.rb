require 'spec_helper'

describe "context_tag()" do
  it "should return some content" do
    visit context_tag_path
    page.body.should_not be_blank
    page.body.should =~ /div/
    page.body.should =~ /context/
  end
end
