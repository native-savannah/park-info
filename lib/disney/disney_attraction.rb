module ParkInfo
    class DisneyAttraction < DisneyBase
        attr_accessor :data

        ID = nil

        include ParkInfo::ActAsBag

        def self.process(attractions)
            attractions.map { |a| self.new(a) }
        end

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