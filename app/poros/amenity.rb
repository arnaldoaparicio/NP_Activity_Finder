class Amenity 

attr_reader :accessibility
    def initialize(data)
       

        @accessibility = find_accessibility(data)


    end

    def find_accessibility(data)
        # data.find_all do |amenity|
        #     amenity[:category].include?("Accessibility")
        # end
        test = []
        if data[:categories].include?("Accessibility")
            test << data[:name]
        end
        test
    end

end