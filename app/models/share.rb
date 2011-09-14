require 'open-uri'

class Share
	
	#Map of share types to implementing classes
	@@shares = {
		"facebook" => "FacebookShare",
		"twitter" => "TwitterShare",
		"buzz" => "BuzzShare",
		"linkedin" => "LinkedinShare",
		"digg" => "DiggShare",
		"reddit" => "RedditShare",
		"stumbleupon" => "StumbleuponShare"
	}
	
	def self.shares
		return @@shares.map {|key,value| key}
	end
		
	#Get the URL share counts for all types
	def self.count_all(url)
		threads = @@shares.map do |type, klass|
			Thread.new do 
				begin
					Thread.current["c"] = Object.const_get(klass).new(url).count
				rescue => e
					puts e.message + "\n\t" + e.backtrace.join("\n\t")
					Thread.current["c"] = {:name => type, :error => e.message}
				end
			end
		end
		threads.map { |t| t.join; t["c"] }
	end
	
	#Get the URL share counts for the one type
	def self.count_one(url, type)
		begin
			return Object.const_get(@@shares[type.downcase]).new(url).count
		rescue => e
			puts e.message + "\n\t" + e.backtrace.join("\n\t")
			return {:name => type.capitalize, :error => e.message}
		end
	end
	
	
	def initialize(url)
		@url = url		
		@error_empty = "Did not return a count"
		@error_invalid = "Did not return valid response"
	end
	
	
	private 
	
	#Construct the map for the count of shares
	def make_count(count)
		return {
			:name => @name,
			:count => count
		}
	end
	
	#Construct a map for an error message
	def make_error(error) 
		return {
			:name => @name,
			:error => error
		}
	end
	
	#Fetches a URL's content
	def fetch(api_url)
		open(api_url).read
	end
	
	#URL escapes a string
	def escape_url
		CGI::escape(@url)
	end
	
	#Strips out a jsonp callback
	def strip_jsonp(s)
		s.match(/{(.*?)}/)[0]
	end
	
end