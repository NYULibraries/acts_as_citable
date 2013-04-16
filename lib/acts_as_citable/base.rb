require 'citero-jruby'
module ActsAsCitable
  attr_accessor :format_field, :data_field
  # Set attribute accessors
  
  # Hooks into an object to define its 'format' and 'data' fields. These are used to
  # translate into other forms of metadata.
  def acts_as_citable &block
    # Allow for configurations
    self.format_field = 'format'
    self.data_field = 'data'
    if block
      yield self
    end
    
    # Use procs to define methods that give the data_field and format_field for inherited models.
    format_string = "#{self.format_field}"
    data_string = "#{self.data_field}"
        
    define_method(:format_field,  Proc.new {format_string} )
    define_method(:data_field, Proc.new {data_string} )
    # Include the instance methods found below
    include InstanceMethods
  end
  
  module InstanceMethods
    # The method_missing override checks to see if the called method
    # can be evaluated to a method name and parameter, then stores it
    # and calls it if it can.
    # For example, to_csf or from_pnx. pnx_to will not work.
    def method_missing(meth, *args, &block)
      # Check to see if it can be evaluated
      if(matches? meth)
        #Defines the method and caches it to the class
        self.class.send(:define_method, meth) do
          # Uses data_field and format_field to translate the metadata.
          # debugger
          Citero.map(_data).send("from_#{_format}").send(meth)
        end
        # calls the method
        send meth, *args, &block
      else
        super
      end
    end
    
    # Returns true if the method can be evaluated to a method name
    # and parameter.
    def respond_to? meth, include_private=false
      if(matches? meth)
        return true
      else
        super
      end
    end
    
    # Private method. Checks to see if the method name is in the list of methods
    # that can accept the formats, and checks to see if the formats are in a list
    # of formats as defined by the Java enum Format.
    def matches? meth
      Citero.map("").respond_to?(meth) && ( directionize(meth).eql?("to") || directionize(meth).eql?(meth.to_s) )
    end
    private :matches?
    
    # Splits the method to get its direction, or method ie to and from.
    def directionize meth, delimiter="_"
      meth.to_s.split(delimiter, 2).first
    end
    private :directionize
    
    def _data
      self.send(data_field.to_sym)
    end
    private :_data
    
    def _format
      self.send(format_field.to_sym)
    end
    private :_format
    
  end
  
end
 
ActiveRecord::Base.extend ActsAsCitable