# SASS config

# Compress output CSS
Sass::Plugin.options[:style] = :compressed

# Look in sub folders for Sass files
Sass::Plugin.options[:template_location] = {}
Dir.glob("#{Rails.root}/public/stylesheets/**/sass").each { |dir| Sass::Plugin.options[:template_location].merge!({dir => dir.to_s.split('/sass')[0]}) }
