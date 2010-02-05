class Invoice
	include Mongoid::Document
	include Mongoid::Timestamps

	validates_presence_of :name, :value, :expiration_date

	has_many :tags

	field :name, :type => String
	field :value, :type => Float
	field :expiration_date, :type => Date
	field :payed, :type => Boolean
	field :month, :type => Integer

	def self.debt
		Invoice.sum(:value)
	end

	def update_worksheet
		worksheet = Worksheet.last
		if worksheet != nil
			worksheet.destroy
		end
		worksheet = Worksheet.new
		worksheet.update_attributes(:month => self.month, :debt => Invoice.debt)
	end

	after_save :update_worksheet
	after_destroy :update_worksheet
end
