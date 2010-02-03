class Invoice
	include Mongoid::Document
	include Mongoid::Timestamps

	validates_presence_of :name, :value, :date

	has_many :tags

	field :name, :type => String
	field :value, :type => Float
	field :date, :type => Date
	field :payed, :type => Boolean
	field :month, :type => Date
	field :total_debt, :type => Float
end