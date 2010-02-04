class Worksheet
	include Mongoid::Document
	include Mongoid::Timestamps

	field :total_debt, :type => Float
	field :month, :type => Integer
end
