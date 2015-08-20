require "date"
require "colorize"

class Blog 
	attr_accessor :all_posts

def initialize 
	@all_posts = [ ]
end

def add_item(item)
	@all_posts.push(item)
end

def create_front_page
	@all_posts = @all_posts.sort_by { |post| post.date }
	publish_front_page()
end

def publish_front_page
	@all_posts.each do |post|
		
		if post.sponsored == true 
			puts "****** #{post.title} ******"
		else
			puts post.title
		end

		puts "********"
		puts post.text
			puts "--------" 
		end
	end

	end

class Post
	attr_accessor :sponsored, :title, :date, :text

	def initialize(sponsored, title, date, text)
		@sponsored = sponsored
		@title = title 
		@date = date
		@text = text
	end

end

blog = Blog.new
post1 = Post.new(false, "Day 1", Date.new(2015,8,16), "The first day of Ironhack!")
post2 = Post.new(true, "Day 2", Date.new(2015,8,17), "The second day of Ironhack!")
post3 = Post.new(false, "Day 3", Date.new(2015,8,18), "The third day of Ironhack!")
post4 = Post.new(false, "Day 4", Date.new(2015,8,19), "The fourth day of Ironhack!")
post5 = Post.new(true, "Day 5", Date.new(2015,8,20), "The fifth day of Ironhack!")
post6 = Post.new(false, "Day 6", Date.new(2015,8,21), "The sixth day of Ironhack!")
post7 = Post.new(false, "Day 7", Date.new(2015,8,22), "The seventh day of Ironhack!")

blog.add_item(post1)
blog.add_item(post2)
blog.add_item(post3)
blog.add_item(post4)
blog.add_item(post5)
blog.add_item(post6)
blog.add_item(post7)

blog.create_front_page

puts "This is blue text on red".blue.on_red.blink
