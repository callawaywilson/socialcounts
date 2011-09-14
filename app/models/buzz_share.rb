class BuzzShare < Share

	def initialize(url)
		@name = "buzz"
		@count_url = "http://www.google.com/buzz/api/buzzThis/buzzCounter?url=[url]"
		super url
	end

	def count
		resp = fetch(@count_url.sub("[url]", escape_url))
		resp = JSON.parse(strip_jsonp(resp))
		return make_count resp[@url]
	end

end