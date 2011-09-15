class FacebookShare < Share

	def initialize(url)
		@name = "facebook"
		@count_url = "http://graph.facebook.com/[url]"
		super url
	end

	def count
		resp = JSON.parse(fetch(@count_url.sub("[url]", escape_url)))
		return make_count resp["shares"] ? resp["shares"] : 0 
	end
	
end