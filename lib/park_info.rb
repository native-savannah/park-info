require 'json'
require 'rest-client'

module ParkInfo
    module ActAsBag
        def method_missing(method_name, *args, &block)
            p method_name.to_s
            if @data && @data.has_key?(method_name.to_s)
                @data[method_name.to_s]
            else
                super
            end
        end

        def keys
            @data.nil? ? [] : @data.keys
        end
    end

    class Bag
        include ActAsBag

        def initialize(data)
            data.each do |key, val|
                if val.is_a? Hash
                    data[key] = Bag.new(val)
                end
            end
            @data = data
        end
    end

end

require File.dirname(__FILE__) + '/disney/disney'