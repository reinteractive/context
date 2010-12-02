require 'machinist/active_record'
require 'faker'
require 'sham'

Sham.email { Faker::Internet.email }
Sham.hostname { Faker::Internet.domain_name }
Sham.name  { Faker::Name.name }
Sham.text  { Faker::Lorem.sentence }

