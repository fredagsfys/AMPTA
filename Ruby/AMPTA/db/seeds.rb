# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

status1 = Status.create(:status_name => "Not started")
status2 = Status.create(:status_name => "In progress")
status1 = Status.create(:status_name => "Bug")
status4 = Status.create(:status_name => "Done")


user1 = User.create(:first_name => "Haris", :last_name => "Kljajic", :email => "haris@kljajic.com", :password => "qwerty")
user2 = User.create(:first_name => "William", :last_name => "Shakespear", :email => "william@shakespear.com", :password => "qwerty")
user3 = User.create(:first_name => "Dear", :last_name => "Bear", :email => "dear@bear.com", :password => "qwerty")
user4 = User.create(:first_name => "Jan", :last_name => "Banan", :email => "jan@banan.com", :password => "qwerty")
user5 = User.create(:first_name => "Pär", :last_name => "Missär", :email => "pär@missar.com", :password => "qwerty")


project1 = Project.create(:name => "AMPTA", :description => "En liten projekttracker", :start_date => "2013-02-03", :end_date => "2013-02-14", :user_id => "1")
project2 = Project.create(:name => "EMPE", :description => "Lite konstig text", :start_date => "2013-02-06", :end_date => "2013-02-14", :user_id => "3")
project3 = Project.create(:name => "DAFET", :description => "Random stuff", :start_date => "2013-02-13", :end_date => "2013-02-14", :user_id => "4")
project4 = Project.create(:name => "ESSA", :description => "Hehehe", :start_date => "2013-02-03", :end_date => "2013-02-14", :user_id => "5")
project5 = Project.create(:name => "AMPTA", :description => "Dude tsting tsting", :start_date => "2013-02-01", :end_date => "2013-02-14", :user_id => "5")
project6 = Project.create(:name => "AMPTA", :description => "Does this rly work?", :start_date => "2013-02-01", :end_date => "2013-02-14", :user_id => "1")
project7 = Project.create(:name => "RAKE", :description => "Rake bake a cake", :start_date => "2013-02-04", :end_date => "2013-02-14", :user_id => "1")
project8 = Project.create(:name => "SSA", :description => "Easdn liten projekttracker", :start_date => "2013-02-03", :end_date => "2013-02-14", :user_id => "3")
project9 = Project.create(:name => "DUDE", :description => "Eeeeen liten projekttracker", :start_date => "2013-02-07", :end_date => "2013-02-14", :user_id => "2")
project10 = Project.create(:name => "A weird project", :description => "En liten projekttracker", :start_date => "2013-02-02", :end_date => "2013-02-14", :user_id => "2")
project11 = Project.create(:name => "AMPTA", :description => "En liten dead", :start_date => "2013-02-05", :end_date => "2013-02-14", :user_id => "1")
project12 = Project.create(:name => "OMFG", :description => "En liten fffff", :start_date => "2013-02-05", :end_date => "2013-02-14", :user_id => "2")
project13 = Project.create(:name => "Easyfy", :description => "En liten projekttracker", :start_date => "2013-02-03", :end_date => "2013-02-14", :user_id => "3")
project14 = Project.create(:name => "Crossfit Highscore", :description => "En liten projekttracker", :start_date => "2013-02-04", :end_date => "2013-02-14", :user_id => "1")
project15 = Project.create(:name => "AMPTA", :description => "En litffff kttracker", :start_date => "2013-02-04", :end_date => "2013-02-14", :user_id => "4")
project16 = Project.create(:name => "AMPTA", :description => "En liten projektt adasracker", :start_date => "2013-02-08", :end_date => "2013-02-14", :user_id => "4")
project17 = Project.create(:name => "EMPE", :description => "En liten prfasojeakttrsdaacker", :start_date => "2013-02-08", :end_date => "2013-02-14", :user_id => "5")

project2.users << user1
project1.users << user2
project1.users << user4
project1.users << user5
project2.users << user4
project2.users << user2
project3.users << user1
project4.users << user2
