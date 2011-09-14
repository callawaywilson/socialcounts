class BuzzShare < Share

	def initialize(url)
		@name = "buzz"
		@count_url = "http://www.google.com/buzz/api/buzzThis/buzzCounter?url=[url]"
		super url
	end

	def count
		resp = JSON.parse(strip_jsonp(fetch(@count_url.sub("[url]", escape_url))))
		return make_count resp[@url]
	end

end