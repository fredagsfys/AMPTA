# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#status1 = Status.create(:status_name => "Not started")
#status2 = Status.create(:status_name => "In progress")
#status2 = Status.create(:status_name => "Done")

user1 = User.create(:first_name => "Oskar", :last_name => "Norling", :email => "oskar.norling@gmail.com", :password => "qwerty")
user2 = User.create(:first_name => "William", :last_name => "Tombs", :email => "william.tombs@gmail.com", :password => "qwerty")

#project1 = Project.create(:name => "Ampta", :description => "Uppgift i webbramverk", :start_date => "2013-02-03", :end_date => "2013-02-14", :owner_id => "1")

#Project.first.users << user1
#Project.first.users << user2