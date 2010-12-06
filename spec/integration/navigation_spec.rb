require 'spec_helper'

describe "Dummy application" do
  it "should be an application" do
    Dummy::Application.should be_a(Rails.application)
  end
end
