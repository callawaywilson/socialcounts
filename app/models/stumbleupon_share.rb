class StumbleuponShare < Share

	def initialize(url)
		@name = "stumbleupon"
		@count_url = "http://www.stumbleupon.com/services/1.01/badge.getinfo?url=[url]"
		super url
	end
	
	def count 
		resp = JSON.parse(fetch(@count_url.sub("[url]", escape_url)))
		return make_count resp["result"]["in_index"] ? resp["result"]["views"] : 0
	end

end