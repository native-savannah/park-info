module ParkInfo
    class Disneyland
        class DisneylandBase < DisneyResort
            RESORT_ID = "80008297";
            REGION = "us";

            def wait_times_url
                "facility-service/theme-parks/#{park_id}/wait-times"
            end
        end

        class CaliforniaAdventure < DisneylandBase
            PARK_ID = "336894";
        end

        class DisneylandPark < DisneylandBase
            PARK_ID = "330339";
        end
    end
end