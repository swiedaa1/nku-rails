# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Admin.count.zero?
  Admin.create!(password: "default", password_confirmation: "default")
end

# Or if you are using a user promoted to admin
if User.where(admin: true).count.zero?
  User.create!(password: "default", password_confirmation: "default", admin: true)
end