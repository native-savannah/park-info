require 'json'
require 'rest-client'

module ParkInfo
    module Bag
        def method_missing(method_name, *args, &block)
            p method_name.to_s
            if @raw && @raw.has_key?(method_name.to_s)
                @raw[method_name.to_s]
            else
                super
            end
        end
    end
end

require File.dirname(__FILE__) + '/disney/disney'