require 'spec_helper'

describe "Dummy application" do
  it "should be an application" do
    Rails.application.should be_a(Dummy::Application)
  end
end
