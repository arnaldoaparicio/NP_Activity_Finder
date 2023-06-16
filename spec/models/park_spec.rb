require 'rails_helper'

RSpec.describe Park, type: :model do
    before do 
        @park = Park.create!(name: "Test", description: "Test", park_code: "Test", latitude: 1.0, longitude: 1.0, phone_number: "Test", email: "Test", entrance_fees: [["Test", "Test2"]], directions_website: "Test", closed_day: "Test", operating_hours: [["Test", "Test2"]], address: "Test", photos: [["Test", "Test2"]] )
    end

    describe 'validations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :description }
        it { should validate_presence_of :park_code }
        it { should validate_presence_of :latitude }
        it { should validate_presence_of :longitude }
        it { should validate_presence_of :phone_number }
        it { should validate_presence_of :email }
        it { should validate_presence_of :entrance_fees }
        it { should validate_presence_of :directions_website }
        it { should validate_presence_of :closed_day }
        it { should validate_presence_of :operating_hours }
        it { should validate_presence_of :address }
        it { should validate_presence_of :photos }
    end

    describe 'relationships' do
        it { should have_many(:user_events) }
        it { should have_many(:events).through(:user_events) }
    end
end