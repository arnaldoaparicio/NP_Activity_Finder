class Weather 

    attr_reader :sunrise, :sunset, :max_temp, :min_temp, :feel_like_day, :feel_like_night, :humidity, :wind_speed, :description, :icon, :day

    def initialize(data)
        @day = data[:dt]
        @sunrise = data[:sunrise]
        @sunset = data[:sunset]
        @max_temp = data[:temp][:max]
        @min_temp = data[:temp][:min]
        @feel_like_day = data[:feels_like][:day]
        @feel_like_night = data[:feels_like][:night]
        @humidity = data[:humidity]
        @wind_speed = data[:wind_speed]
        @description = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end

end