require 'spec_helper'

describe "Admin panel, pages" do
  before do
    create_page!(:root)
  end
  
  context "no user" do
    it "should render correctly from the slug" do
      visit "/context/admin"
      assert_seen("You must be an admin to access that area.")
    end
  end
end
