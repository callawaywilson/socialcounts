class TwitterShare < Share

	def initialize(url)	
		@name = "twitter"
		@count_url = "http://urls.api.twitter.com/1/urls/count.json?url=[url]"
		super url
	end

	def count
		resp = JSON.parse(fetch(@count_url.sub("[url]", escape_url)))
		return make_count resp["count"]
	end

end