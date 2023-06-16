require 'rails_helper'

RSpec.describe Event, type: :model do

    describe 'validations' do
        it { should validate_presence_of :location }
        it { should validate_presence_of :description }
        it { should validate_presence_of :name }
        it { should validate_presence_of :date }
        it { should validate_presence_of :time}
        it { should validate_presence_of :free }
        it { should validate_presence_of :event_code }
        it { should validate_presence_of :fee_info }
        it { should validate_presence_of :latitude}
        it { should validate_presence_of :longitude}
        it { should validate_presence_of :type}
    end

    # describe 'relationships' do
    #     it {should have_many(:user_events)}
    #     it {should have_many(:users).through(:user_events)}
    # end
end