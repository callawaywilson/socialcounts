class SharesController < ApplicationController

	#GET count
	def count
		if params[:url].blank?
			@error = {:error => "No URL"}
			respond_error(@error, params[:callback])
			return
		end
			
		@shares = count_url(params[:url], params[:type])
		respond(@shares, params[:callback])
	end


	private 
	
	def count_url(url, type)
		type.blank? ?
			Share.count_all(params[:url]) : 
			[Share.count_one(params[:url], params[:type])]	
	end

end