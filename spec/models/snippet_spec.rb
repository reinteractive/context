require 'spec_helper'

describe Snippet do
  before(:each) do
    @snippet=Snippet.create!(:name => 'test', :body => 'I am a call to context!')
  end
end
