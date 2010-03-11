class Invoice
	include Mongoid::Document
	include Mongoid::Timestamps

	validates_presence_of :name, :ammount, :due_date
  
	has_many :tags

	field :name, :type => String
	field :ammount, :type => Float
	field :notes, :type => String
	field :due_date, :type => Date
	field :paid, :type => Boolean

	field :month, :type => Integer

	def self.debt(month)
		invoices = Invoice.find(:conditions => { :month => month })
		if invoices.size > 0
				debt = Invoice.find(:conditions => { :month => month }).sum(:ammount)
		else
			debt = 0.0
		end
	end

	def update_worksheet
		worksheet = Worksheet.find(:last, :conditions => { :month => self.month })
		if worksheet != nil
			worksheet.destroy
		end
		worksheet = Worksheet.new
		worksheet.update_attributes(:month => self.month, :debt => Invoice.debt(self.month))
	end

	after_save :update_worksheet
	after_destroy :update_worksheet
end
