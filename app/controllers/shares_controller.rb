class SharesController < ApplicationController

	#GET count
	def count
		url = clean_url params[:url] 
		if url.blank?
			@error = {:error => "No URL"}
			respond_error(@error, params[:callback])
			return
		end
			
		@shares = count_url(url, params[:type])
		respond(@shares, params[:callback])
	end


	private 
	
	def count_url(url, type)
		type.blank? ? Share.count_all(url) : [Share.count_one(url, type)]	
	end

end