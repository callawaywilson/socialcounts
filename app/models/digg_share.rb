class DiggShare < Share

	def initialize(url)
		@name = "digg"
		@count_url = "http://widgets.digg.com/buttons/count?url=[url]"
		super url
	end
	
	def count
		resp = JSON.parse(strip_jsonp(fetch(@count_url.sub("[url]", escape_url))))
		return make_count resp["diggs"]
	end

end