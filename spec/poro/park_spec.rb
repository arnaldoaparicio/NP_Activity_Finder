require 'rails_helper'
require 'pry'

RSpec.describe " Park Poro" do

    it "tests park attributes" do 

        data = {
            name: "Test",
            description: "This is a description",
            park_code: "1",
            latitude: "1234",
            longitude: "456",
            phone_number: "5555555555",
            email: "bob@bob.com",
            entrance_fees: [{
                cost: "$1.00",
                description: "description",
                title: "title"
            },
            {
                cost: "$2.00",
                description: "description2",
                title: "title2"

            }],
            directions_website: "www.www.com",
            closed_day: "Christmas",
            operating_hours: {
                monday: "9",
                tuesday: "9",
                wednesday:"9",
                thursday:"9",
                friday:"9",
                saturday:"9",
                sunday:"9"
            },
            address: "123 test rd, Bear, DE 19701",
            photos: [{
                credit: "wade",
                title: "wade",
                altText: "wade2",
                caption: "wade3",
                url: "wade4.jpg"
            },
            {
                credit: "wade3",
                title: "wade",
                altText: "wade2",
                caption: "wade3",
                url: "wade4.jpg"
            }
        ]

            
        }
        park = Park.new(data)
        # binding.pry
        expect(park).to be_a Park
        
    end

end