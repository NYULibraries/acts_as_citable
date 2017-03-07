class CustomCitableRecord < ActiveRecord::Base
  acts_as_citable do |c|
    c.data_field = "my_data"
    c.format_field = :my_format
  end
end
