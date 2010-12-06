require 'spec_helper'

describe "context()" do
  it "should return some content" do
    visit context_path
    page.body.should_not be_blank
    page.body.should =~ /context/
  end
end
