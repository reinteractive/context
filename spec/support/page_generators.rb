def create_page!(name)
  case name.to_s
    when 'root'
      Context::Page.create!(
                            :name      => "Home",
                            :slug      => "/",
                            :format    => "text/plain",
                            :body      => "Welcome to context.",
                            :published => true)
    when 'portfolio'
      Context::Page.create!(
                            :name      => "Portfolio",
                            :slug      => "portfolio",
                            :format    => "text/html", 
                            :body      => "<h1>Portfolio</h1>
                                          Look at the pretty things!",
                            :published => true)
  else
    raise "I don't know what the #{name} page is.
          Tell me in spec/support/page_generators.rb"
  end
end