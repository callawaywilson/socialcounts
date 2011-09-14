class ApplicationController < ActionController::Base
  protect_from_forgery 
  
  private
  
  def respond(val, callback)
  	respond_to do |format|
			format.html
			format.json {
				render :json => callback ? jsonp(callback, JSON.generate(val)) : val
			}
			format.xml {render :xml => val}
		end
  end
  
  def respond_error(val, callback)
		respond_to do |format|
			format.html 
			format.json {
				render :json => callback ? jsonp(callback, JSON.generate(val)) : val,
				:status => :error
			}
			format.xml { render :xml => {:error => val}, :status => :error}
		end
  end
  
  def clean_url(url)
  	return url.starts_with?("http") ? url : "http://#{url}" 
  end
  
  def jsonp(callback, data)
  	#clean function name to prevent injection
  	cb = callback.gsub(/[^a-zA-Z0-9_]/, "")
  	return "#{cb}(#{data})"
  end
  
end
