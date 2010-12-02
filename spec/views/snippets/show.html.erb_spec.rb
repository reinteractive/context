require 'spec_helper'

describe "snippets/show.html.erb" do
  before(:each) do
    @snippet = assign(:snippet, stub_model(Snippet))
  end

  it "renders attributes in <p>" do
    render
  end
end
