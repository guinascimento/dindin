ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
	html_tag + "<span class='error'>" + instance.error_message + "</span>"
end
