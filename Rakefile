#!/usr/bin/env rake
require 'bundler'
require File.expand_path('../config/boot', __FILE__)
require File.expand_path('../config/environment', __FILE__)
Bundler::GemHelper.install_tasks

CONTEXT_ROOT=Context::Engine.root
# Load up all the Rake tasks that we provide to users
#Context::Engine.load_tasks

# Load up all the Rake tasks that we provide to context developers
Dir["#{CONTEXT_ROOT}/tasks/*.rake"].sort.each { |ext| load ext }
