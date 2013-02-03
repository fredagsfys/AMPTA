# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(:fname => "Haris", :lname => "Kljajic", :email => "haris.kljajic@hotmail.se", :password => "test123")
u2 = User.create(:fname => "Annie", :lname => "Bäckström", :email => "annie.backstrom@hotmail.se", :password => "test123")

p1 = Project.create(:name => "AMPTA", :description => "hejhopp somethinglolol hehe")

u1.projects << p1
u2.projects << p1