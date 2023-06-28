class MapFacade

    def self.get_service(location, q, circle, sort)
        search = MapService.get_service(location, q, circle, sort)
        search[:results].map do |business|
            Business.new(business)
        end
    end


end