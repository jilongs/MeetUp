# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

states = [
  {:name => "IL"},
  {:name => "NY"},
  {:name => "WA"},
  {:name => "CA"}
]

State.destroy_all
states.each do |state|
  s = State.new
  s.name = state[:name]
  s.save
end

citys = [
  { :name => "Chicago",
    :state_id => State.find_by_name("IL").id
  },
  { :name => "New York",
    :state_id => State.find_by_name("NY").id
  },
  { :name => "Los Angeles",
    :state_id => State.find_by_name("CA").id
  },
  { :name => "San Francisco",
    :state_id => State.find_by_name("CA").id
  },
  { :name => "Seattle",
    :state_id => State.find_by_name("WA").id
  }
]
City.destroy_all
City.create citys
