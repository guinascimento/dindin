class Worksheet
	include Mongoid::Document
	include Mongoid::Timestamps

	field :debt, :type => Float
	field :month, :type => Integer
end
