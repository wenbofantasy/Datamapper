require 'rubygems'
require 'data_mapper'
#require 'dm-sqlite-adapter'

# Open the database test1.db
#'mysql://user:password@hostname/database'
DataMapper.setup :default, "mysql://root:123456@localhost/cc"

#DataMapper.setup :default, "sqlite3://#{Dir.pwd}/test4.db" 

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
