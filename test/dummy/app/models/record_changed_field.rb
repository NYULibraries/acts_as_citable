class RecordChangedField < ActiveRecord::Base
  if defined?(ActiveModel::MassAssignmentSecurity)
    attr_accessible :data, :from_format
  else
    attr_reader :data, :from_format
    attr_writer :data, :from_format
  end
  acts_as_citable do |c|
    c.format_field = 'from_format'
  end
end
