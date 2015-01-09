class RecordChangedField < ActiveRecord::Base
  # attr_accessible :data, :from_format
  acts_as_citable do |c|
    c.format_field = 'from_format'
  end
end
