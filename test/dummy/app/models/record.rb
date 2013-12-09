class Record < ActiveRecord::Base
  if defined?(ActiveModel::MassAssignmentSecurity)
    attr_accessible :data, :format
  else
    attr_reader :data, :format
    attr_writer :data, :format
  end
  acts_as_citable
end
