class Record < ActiveRecord::Base
  # attr_accessible :data, :format
  acts_as_citable
end
