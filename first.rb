require 'rubygems'
require 'dm-core'
require 'dm-migrations'

# Open the database test1.db
DataMapper.setup :default, "sqlite3://#{Dir.pwd}/test1.db" 

# Define the Person model
class Person
  include DataMapper::Resource

  property :firstname, String
  property :lastname, String
  property :email, String, :key => true
end

# Automatically create the tables if they don't exist
DataMapper.auto_migrate!

# Create a new record
p = Person.new
p.attributes = {
  :firstname => 'John',
  :lastname => 'Doe',
  :email => 'john.doe@email.com'
}

# Save it to the database
p.save

# Make some changes to the object
p.lastname = 'Smith'
p.save

# Create a new object and destroy it
p2 = Person.new
p2.email = 'testing@testing.com'
p2.save

p2.destroy

# Find a record from the database
p3 = Person.get('john.doe@email.com')
#puts p3.inspect
