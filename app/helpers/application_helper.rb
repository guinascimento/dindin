module ApplicationHelper
	def is_active?(controller_name)
	  "current" if params[:controller] == controller_name
	end
end