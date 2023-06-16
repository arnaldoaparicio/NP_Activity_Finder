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

    expect(park.name).to eq('Test')
    expect(park.description).to eq('This is a description')
    expect(park.park_code).to eq('1')
    expect(park.latitude).to eq('1234')
    expect(park.longitude).to eq('456')
    expect(park.phone_number).to eq('5555555555')
    expect(park.email).to eq('bob@bob.com')
    expect(park.entrance_fees).to eq([['$1.00', 'description'], ['$2.00', 'description2']])
    expect(park.directions_website).to eq('www.www.com')
    expect(park.closed_day).to eq('Christmas')
    expect(park.operating_hours).to eq([
                                         %w[Monday 9],
                                         %w[Tuesday 9],
                                         %w[Wednesday 9],
                                         %w[Thursday 9],
                                         %w[Friday 9],
                                         %w[Saturday 9],
                                         %w[Sunday 9]
                                       ])
    expect(park.address).to eq('123 test rd, Bear, DE 19701')
    expect(park.photos).to eq([['wade4.jpg', 'wade2'], ['wade4.jpg', 'wade2']])
  end
end
