require 'rubygems'
require 'data_mapper'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/test2.db" 

class Zoo
  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :description, Text
  property :inception,   DateTime
  property :open,        Boolean,  :default => false
end

#zoo = Zoo.create(:name => 'The Glue Factory', :inception => Time.now)
#zoo = Zoo.first_or_create({ :name => 'The Glue Factory' }, { :inception => Time.now })

#zoo = Zoo.first_or_create({ :name => 'The Glue Factory' }, {
  #:name      => 'Brooklyn Zoo',
  #:inception => Time.now
#})

#zoo = Zoo.new
#zoo.attributes = { :name => 'The Glue Factory', :inception => Time.now }
#zoo.save

#zoo = Zoo.new(:name => 'Awesome Town Zoo')                  # Pass in a hash to the new method
#zoo.name = 'Dodgy Town Zoo'                                 # Set individual property
#zoo.attributes = { :name => 'No Fun Zoo', :open => false } 

#zoo = Zoo.get(5)
#zoo.destroy

#Zoo.all.destroy

DataMapper.finalize
DataMapper.auto_upgrade!

#adapter = DataMapper.repository(:default).adapter
## Insert multiple records with one statement (MySQL)
#adapter.execute("INSERT INTO zoos (id, name) VALUES (1, 'Lion'), (2, 'Elephant')")
## The interpolated array condition syntax works as well:
#adapter.execute('INSERT INTO zoos (id, name) VALUES (?, ?), (?, ?)', 1, 'Lion', 2, 'Elephant')
