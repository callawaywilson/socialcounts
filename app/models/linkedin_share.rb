class LinkedinShare < Share

	def initialize(url)
		@name = "linkedin"
		@count_url = "http://www.linkedin.com/cws/share-count?url=[url]"
		super url
	end
	
	def count
		resp = JSON.parse(strip_jsonp(fetch(@count_url.sub("[url]", escape_url))))
		return make_count resp["count"]
	end

end