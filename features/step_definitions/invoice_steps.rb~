Given /^I am an user$/ do
	user = User.new(:name => "Jhon", :salary => 5000)
	user.save
end


And /^the following invoices:$/ do |invoice|
  invoice.hashes.each do |hash|
    i = Invoice.new(:name => hash[:name], :value => hash[:value], :expiration_date => hash[:date])
    i.save
  end
end
