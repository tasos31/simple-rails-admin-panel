# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(
	:username => "simplerailsadmin",
	:password => "simplerailsadmin",
	:password_confirmation => "simplerailsadmin",
	:version_number => 0,
	:products_last_position=>0,
	:wines_last_position=>0,
	:services_last_position=>0,
	:email=>"simplerailsadmin@gmail.com",
	:telephone=>"00000000",
	:address=>"SimpleRailsAdmin 00"
)

@admin = Admin.first
I18n.locale = :en
@admin.title = "SimpleRailsAdmin"
@admin.text = "SimpleRailsAdmin"
I18n.locale = :de
@admin.title = "SimpleRailsAdmin"
@admin.text = "SimpleRailsAdmin"
@admin.save
I18n.locale = :el
@admin.title = "SimpleRailsAdmin"
@admin.text = "SimpleRailsAdmin"
@admin.save
