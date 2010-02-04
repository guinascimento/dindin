module ApplicationHelper
	def is_active?(controller_name)
	  "current" if params[:controller] == controller_name
	end

	def current_month?(month)
		time = Time.new
		"current_month" if time.month == month
	end
end
