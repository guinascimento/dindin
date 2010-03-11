require 'deadweight'

Deadweight::RakeTask.new do |dw|
  dw.stylesheets = %w(/stylesheets/scaffold.css)
  dw.pages = %w(/dashboard /3/invoices/new /3/invoices/list)
end