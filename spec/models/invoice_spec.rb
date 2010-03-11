require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Invoice do
	before(:each) do
  	@invoice = Invoice.new
	end

  it "should complain about blank fields" do
		@invoice.should_not be_valid
		@invoice.errors.on(:name).should eql("can't be blank")
		@invoice.errors.on(:value).should eql("can't be blank")
		@invoice.errors.on(:expiration_date).should eql("can't be blank")
  end
end
