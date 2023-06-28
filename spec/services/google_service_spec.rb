require 'rails_helper'

RSpec.describe GoogleService do
    it 'returns lat and long for a given address', :vcr do

        address = '15 Wildfields ct, Bear, DE 19701'
        response = GoogleService.get_lat_long(address)
    end

end