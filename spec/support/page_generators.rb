def create_page!(name)
  case name.to_s
    when 'root'
      Context::Page.create!(
                            :name => "Home",
                            :slug => "",
                            :format => "text/plain",
                            :body => "Welcome to context.")
    when 'portfolio'
      Context::Page.create!(
                            :name => "Portfolio",
                            :slug => "portfolio",
                            :format => "text/html", 
                            :body => "<h1>Portfolio</h1>
                                      Look at the pretty things!")
  else
    puts "I don't know what that page is.
          Tell me in spec/support/page_generators.rb"
  end
end