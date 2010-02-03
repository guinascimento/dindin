class User
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name, :type => String
	field :salary, :type => Float
end