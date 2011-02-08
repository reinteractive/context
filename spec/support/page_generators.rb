def create_page!(name)
  case name.to_s
    when 'root'
      Context::Page.create!(
                            :name => "Home",
                            :path => "/",
                            :format => "text/plain",
                            :body => "Welcome to context.")
  else
    puts "I don't know what that page is.
          Tell me in spec/support/page_generators.rb"
  end
end