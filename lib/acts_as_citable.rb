require 'citero'
module ActsAsCitable
  
  def acts_as_citable &block
    cattr_accessor(:format_field) {'format'}
    cattr_accessor(:data_field) {'data'}
    if block
      yield self
    end
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
          # Splits the method and parameter. See formatize and directionize
          Citero.map(self[self.data_field]).send("from_#{self[self.format_field]}").send(meth)
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
      Citero.map("").respond_to?(meth) && directionize(meth).eql?("to")
    end
    private :matches?
    
    # Splits the method to get its direction, or method ie to and from.
    def directionize meth, delimiter="_"
      meth.to_s.split(delimiter, 2).first
    end
    private :directionize
  end
  
end
 
ActiveRecord::Base.extend ActsAsCitable