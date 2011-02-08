require 'spec_helper'

describe "Admin panel, pages" do
  before do
    create_page!(:root)
    login!(:admin => true)
  end
   
  it "displays a list of pages" do
    visit context_admin_pages_path
    page.should have_css("h2", :text => "Pages")
  end
end