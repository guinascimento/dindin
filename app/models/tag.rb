class Tag 
  include Mongoid::Document

  belongs_to :invoice, :inverse_of => :tags

  field :name, :type => String
end
