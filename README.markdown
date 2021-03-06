Context
===========

Context will be a content management system for Rails 3 created by [RubyX](http://rubyx.com/)

It is NOT production ready!  Some of the features outlined below are still a wish list.

Overview
-----------

The rationale behind Context is that you can add it to any existing Rails 3 application without having to rewrite your rails application, change your authentication methods or rewrite your routes.

The other important thing of context is that it separates presentation from content.  Templates and stylesheets are kept in the source control repository.  Only actual editable content is stored in the database.

The idea is that context provides a non intrusive way for clients to get custom data into the rails app as well as provide them with a way to update that data.

Requirements
-----------

* Rails 3

Usage
-----------

Context uses Rails 3 engines and so only works with Rails 3.

You instal context through adding the gem to your gemfile:

  gem "context"

Once you bundle install, you will need to generate the migrations:

  rake context:install

This will create the database tables needed for context to work. Once done:

  rake db:migrate

And then you can fire up your rails server and can navigate to /context/admin

Development
-----------

The tests all use a local sqlite3 database in a Rails 3.0.3 application. Run the test suite like so:

  rake spec
