require 'rails_helper'
require 'pry'

RSpec.describe ' Park Poro' do
  it 'tests park attributes' do
    
    data = {
      fullName: 'Test',
      description: 'This is a description',
      parkCode: '1',
      latitude: '1234',
      longitude: '456',
      contacts: { phoneNumbers: [{ phoneNumber: '5555555555' }],
                  emailAddresses: [{ emailAddress: 'bob@bob.com' }] },
      entranceFees: [{
        cost: '$1.00',
        description: 'description',
        title: 'title'
      },
                     {
                       cost: '$2.00',
                       description: 'description2',
                       title: 'title2'

                     }],
      directionsUrl: 'www.www.com',
      operatingHours: [{
        description: 'Christmas',
        standardHours: {
          monday: '9',
          tuesday: '9',
          wednesday: '9',
          thursday: '9',
          friday: '9',
          saturday: '9',
          sunday: '9'
        }
      }],
      addresses: [{ line1: '123 test rd',
                    city: 'Bear',
                    stateCode: 'DE',
                    postalCode: '19701' }],
      images: [{
        credit: 'wade',
        title: 'wade',
        altText: 'wade2',
        caption: 'wade3',
        url: 'wade4.jpg'
      },
               {
                 credit: 'wade3',
                 title: 'wade',
                 altText: 'wade2',
                 caption: 'wade3',
                 url: 'wade4.jpg'
               }]

    }
    park = Park.new(data)
    expect(park).to be_a Park
  end
end
