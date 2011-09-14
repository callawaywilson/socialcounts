class RedditShare < Share

	def initialize(url)
		@name = "reddit"
		@count_url = "http://www.reddit.com/api/info.json?url=[url]&limit=100"
		super url
	end
	
	def count
		resp = JSON.parse(fetch(@count_url.sub("[url]", escape_url)))
		return make_count resp["data"]["children"].length
	end

end