module ParkInfo
    class DisneyResort < DisneyBase
        RESORT_ID = nil
        PARK_ID = nil

        include ParkInfo::ActAsBag

        def wait_times
            if wait_times_timed_out
                @data = get(wait_times_url)
                @wait_times_timeout = Time.now + CACHE_TIMEOUT
            end
            @data
        end

        def attractions
            if wait_times_timed_out
                wait_times
                @attractions = ParkInfo::DisneyAttraction.process @data['entries']
            end
            @attractions
        end

        def wait_times_url
             "facility-service/theme-parks/#{park_id};destination=#{resort_id}/wait-times?region=#{region}"
        end

        def facilities_info_url
            "mobile-service/public/destinations/#{resort_id};entityType=destination/facilities?region=#{region}"
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

        protected

        def wait_times_timed_out
            @wait_times_timeout.nil? || Time.now > @wait_times_timeout
        end
    end
end