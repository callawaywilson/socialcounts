class FacebookShare < Share

	def initialize(url)
		@name = "facebook"
		@count_url = "http://graph.facebook.com/[url]"
		super url
	end

	def count
		resp = fetch(@count_url.sub("[url]", escape_url))
		resp = JSON.parse(resp)
		return make_count resp["shares"]
	end
	

end