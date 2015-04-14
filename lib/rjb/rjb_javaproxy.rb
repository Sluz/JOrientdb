
require 'jorientdb/java'

module Rjb
  class Rjb_JavaProxy
    def initialize_proxy
    end
    
    #--- Convert some Java object into Ruby object
    def to_ruby_value
      if JOrientdb::Java::Util::AbstractMap.isInstance(self)
        result = {}
        entries = self.entrySet()
        for key_value in entries
          unless key_value.getValue() == nil
            result[key_value.getKey().to_s] = key_value.getValue().to_ruby_value
          else
            result[key_value.getKey().to_s] = nil
          end
        end
      elsif JOrientdb::Java::Util::AbstractCollection.isInstance(self)
        result = []
        for value in self
          unless value == nil
            result << value.to_ruby_value
          end
        end
      elsif JOrientdb::Java::Lang::Boolean.isInstance(self)
        result = self.booleanValue()
      elsif JOrientdb::Java::Lang::Number.isInstance(self)
        if JOrientdb::Java::Lang::Double.isInstance(self)
          result = self.doubleValue()
        elsif JOrientdb::Java::Lang::Float.isInstance(self)
          result =  self.floatValue()
        else
          result =  self.longValue()
        end
      else
         result = self.to_s
      end
      result
    end
  end
end