module ParkInfo
    class DisneyResort < DisneyBase
        RESORT_ID = nil
        PARK_ID = nil

        include ParkInfo::Bag

        def wait_times
            url = "facility-service/theme-parks/#{park_id};destination=#{resort_id}/wait-times"
            @raw = get(url)
        end

        def facilities_info
            url = "mobile-service/public/destinations/#{resort_id};entityType=destination/facilities?region=#{region}"
        end

        def resort_id
            self.class::RESORT_ID
        end

        def park_id
            self.class::PARK_ID
        end

        def region
            self.class::REGION
        end
    end
end