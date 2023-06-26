class WeatherFacade

    def self.get_forecast(latitude,longitude)
        test = WeatherService.get_forecast(latitude,longitude)
        daily = test[:daily]
        daily.map do |day|
            Weather.new(day)
        end
    end

  end
  