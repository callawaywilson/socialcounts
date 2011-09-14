module ApplicationHelper

	def share_types
		types = [["All Services", ""]]
		Share.shares.each {|s| types.push [s,s]}
		return types
	end

end
