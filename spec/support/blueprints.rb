require 'machinist/active_record'
require 'faker'
Refinery::Locations::Location.blueprint do 
	name { Faker::Company.name }
	address { Faker::Address.street_address }
	city { Faker::Address.city }
	state_or_province { Faker::Address.state }
	zip { Faker::Address.zip }
	country { "USA" }
	website { Faker::Internet.url }
	phone { Faker::PhoneNumber.phone_number }
	online { false }
	women { false }
	handbags { true }
	shoes { true }
	eyewear { false }
	jewelry { true }
	textile { false }
end

Refinery::Locations::Import.blueprint do
	filename { "#{Faker::Lorem.words(1)}.csv" }
	status { 'empty' }
end