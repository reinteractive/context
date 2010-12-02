require 'spec_helper'

describe "Context exists" do

  it "should be a module" do
    Context.should be_kind_of Module
  end

end