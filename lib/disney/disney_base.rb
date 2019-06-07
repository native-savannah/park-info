module ParkInfo
    class DisneyBase
        TOKEN_URL = "https://authorization.go.com/token";
        TOKEN_BODY = "grant_type=assertion&assertion_type=public&client_id=WDPRO-MOBILE.MDX.WDW.ANDROID-PROD";
        APP_ID = "WDW-MDX-ANDROID-3.4.1";
        BASE_URL = "https://api.wdpro.disney.go.com/";

        REGION = nil

        # How long to keep cached data, in seconds
        CACHE_TIMEOUT = 5 * 60 # 5 minutes

        def get_auth_token
            resp = RestClient.post(TOKEN_URL, TOKEN_BODY)
            data = JSON.parse(resp)
            @auth_token = data['access_token']
        end

        def get(url_pattern, data={})
            get_auth_token
            headers = {
                "Authorization" => "BEARER #{@auth_token}",
                "Accept" => "application/json;apiversion=1",
                "X-Conversation-Id" => "WDPRO-MOBILE.MDX.CLIENT-PROD",
                "X-App-Id" => APP_ID,
                "X-Correlation-ID" => Time.now(),
                'content_type' => 'json'
            }
            url = BASE_URL + url_pattern
            data['region'] = region

            resp = RestClient::Request.execute(method: :get, url: url, payload: data.to_json, headers: headers)
            JSON.parse(resp)
        end

        def region
            self.class::REGION
        end
    end
end