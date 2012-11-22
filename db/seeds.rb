# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "populator"
require "faker"

HitList.populate(20) do |hit|
  hit.agent = Faker::Name.name
  hit.summary = Faker::Lorem.paragraph
  hit.status = ['Disavowed', 'RED', 'Active', 'MIA']
end
