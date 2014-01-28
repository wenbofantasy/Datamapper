require 'rubygems'
require 'data_mapper'
require  'dm-migrations'
DataMapper.auto_migrate!
DataMapper.auto_upgrade!

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/test3.db" 
#DataMapper.setup(:default, "sqlite::memory:")
#DataMapper.setup(:default, 'sqlite:///path/to/project.db')
class Post
  include DataMapper::Resource
  has n, :category
  has n, :category, :through => :category
  has n, :comments

  property :id,         Serial    # An auto-increment integer key
  property :title,      String    # A varchar type string, for short strings
  property :body,       Text      # A text block, for longer string data.
  property :created_at, DateTime  # A DateTime, for any date you might like.
end

class Comment
  include DataMapper::Resource
  belongs_to :post

  property :id,         Serial
  property :posted_by,  String
  property :email,      String
  property :url,        String
  property :body,       Text
end

class Category
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String

  belongs_to :category
  belongs_to :post
end
DataMapper.finalize
DataMapper.auto_upgrade!

@post = Post.create(
  :title      => "My first DataMapper post",
  :body       => "A lot of text ...",
  :created_at => Time.now
)

# Or new gives you it back unsaved, for more operations
#@post = Post.new(:title => "asdf")
puts @post.title
puts @post.created_at

@post.save 
