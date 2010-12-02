require 'spec_helper'

describe "Dummy testing rails application" do

  it "should be a Rails application" do
    Rails.application.should be_kind_of Dummy::Application
  end

end