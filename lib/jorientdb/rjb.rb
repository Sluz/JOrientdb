require 'rjb'

module Rjb
  Boolean            = import('java.lang.Boolean')
  String             = import('java.lang.String')
  Number             = import('java.lang.Number')
  AbstractMap        = import('java.util.AbstractMap')
  AbstractCollection = import('java.util.AbstractCollection')

  class Rjb_JavaProxy
    def initialize_proxy
    end
    
    def to_ruby_value
      if Rjb::AbstractMap.isInstance(self)
        result = {}
        for key_value in self
          unless key_value.getValue().nil?
            result[key_value.getKey().to_s] = key_value.getValue().to_ruby_value
          end
        end
      elsif Rjb::AbstractCollection.isInstance(self)
        result = []
        for value in self
          result << value.to_ruby_value
        end
      elsif Rjb::Boolean.isInstance(self)
         result = self.booleanValue()
      elsif Rjb::Number.isInstance(self)
         result = self.to_i
      else
         result = self.to_s
      end
    end
  end
end