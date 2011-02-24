require 'spec_helper'

describe "Admin panel, pages" do
  before do
    create_page!(:root)
    create_page!(:portfolio)
    login!(:admin => true)
    visit context_admin_pages_path
  end

  # TODO: Clean this up once we aren't hacking ApplicationController using class_eval
  after do
    logout!
  end
  
  def assert_home
    page.current_url.should eql(context_admin_pages_url)
  end
   
  it "displays a list of pages, able to view one" do
    page.should have_css("h2", :text => "Pages")
    click 'Home'
    page.current_url.should eql("http://www.example.com/context/admin/pages/1")
  end
  
  it "creates a new page" do
    click 'New Page'
    fill_in 'Name', :with => "Contact Us"
    select 'HTML', :from => "Format"
    fill_in 'Body', :with => "Please get in contact with us by following..."
    select 'Published', :from => "State"
    click 'Create Page'
    assert_seen("A new page has been created.")
    assert_home

    click '/contact-us'
    assert_seen("Please get in contact with us by following...")
  end
  
  it "creates a new page nested under portfolio" do
    click 'New Page'
    fill_in 'Name', :with => "2010"
    select 'HTML', :from => "Format"
    select 'Portfolio', :from => "Parent"
    fill_in 'Body', :with => "Showing off stuff from 2010"
    select 'Published', :from => "State"
    click 'Create Page'

    assert_seen("A new page has been created.")
    assert_home
    click '/portfolio/2010'
    assert_seen("Showing off stuff from 2010")
  end
  
  it "cannot create a new page if the name is left blank" do
    click 'New Page'
    click 'Create Page'
    assert_seen("This page could not be created.")
  end
  
  it "cannot create a page under root"
    # Doing so will generate an incorrect path of something like //contact-us.
  
  it "updates a page" do
    click 'Home'
    click 'Edit Page'
    fill_in 'Name', :with => "THE BEST PAGE EVER"
    click 'Update Page'
    
    assert_seen('This page has been updated')
    page.current_url.should eql("http://www.example.com/context/admin/pages/1")
    page.should have_css("h2", :text => "THE BEST PAGE EVER")
    page.should_not have_css("h2", :text => "Home")
  end
  
  it "cannot update a page if the name is left blank" do
    click 'Home'
    click 'Edit Page'
    fill_in 'Name', :with => ""
    click 'Update Page'
    assert_seen("This page could not be updated.")
  end
  
end
