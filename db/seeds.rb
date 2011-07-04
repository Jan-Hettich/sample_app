# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'faker'

User.destroy_all

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  name = first_name + ' ' + last_name
  email = first_name + last_name[0] + '@tutorial.org'
  email.downcase!
  user = User.create! :name => name, :email => email
  50.times do
    user.microposts.create!(:content => Faker::Lorem.sentence(5))
  end

end