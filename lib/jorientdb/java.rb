
require 'rjb'

module JOrientdb 
  module Java
    module Lang
      Boolean            = Rjb::import('java.lang.Boolean')
      String             = Rjb::import('java.lang.String')
      Number             = Rjb::import('java.lang.Number')
      Double             = Rjb::import('java.lang.Double')
      Float              = Rjb::import('java.lang.Float')
    end
    
    module Util
      AbstractMap        = Rjb::import('java.util.AbstractMap')
      AbstractCollection = Rjb::import('java.util.AbstractCollection')
    end
  end
end