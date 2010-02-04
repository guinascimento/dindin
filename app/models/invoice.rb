class Invoice
	include Mongoid::Document
	include Mongoid::Timestamps

	validates_presence_of :name, :value, :date

	has_many :tags

	field :name, :type => String
	field :value, :type => Float
	field :date, :type => Date
	field :payed, :type => Boolean
	field :month, :type => Integer

	def total_debt
		Invoice.sum(:value)
	end

	def update_worksheet
		worksheet = Worksheet.new
		worksheet.update_attributes(:month => self.month, :total_debt => total_debt)
	end

	after_save :update_worksheet
	after_destroy :update_worksheet
end
