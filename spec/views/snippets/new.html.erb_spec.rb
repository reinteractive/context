require 'spec_helper'

describe "snippets/new.html.erb" do
  before(:each) do
    assign(:snippet, stub_model(Snippet).as_new_record)
  end

  it "renders new snippet form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => snippets_path, :method => "post" do
    end
  end
end
