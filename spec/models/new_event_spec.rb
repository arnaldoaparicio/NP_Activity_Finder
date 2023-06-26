require 'rails_helper'

RSpec.describe NewEvent, type: :model do
  describe 'validations' do
    # it { should validate_presence_of :location }
    it {should allow_value(:nil).for(:location)}
    # it { should validate_presence_of :description }
    it {should allow_value(:nil).for(:description)}
    # it { should validate_presence_of :name }
    it {should allow_value(:nil).for(:name)}
    # it { should validate_presence_of :date }
    it {should allow_value(:nil).for(:date)}
    # it { should validate_presence_of :time }
    it {should allow_value(:nil).for(:time)}
    # it { should validate_presence_of :free }
    it {should allow_value(:nil).for(:free)}
    # it { should validate_presence_of :event_code }
    it {should allow_value(:nil).for(:event_code)}
    # it { should validate_presence_of :fee_info }
    it {should allow_value(:nil).for(:fee_info)}
    # it { should validate_presence_of :latitude }
    # it {should allow_value(:nil).for(:latitude)}
    # it { should validate_presence_of :longitude }
    # it {should allow_value(:nil).for(:longitude)}
    # it { should validate_presence_of :type }
    it {should allow_value(:nil).for(:type_of_event)}
  end

  describe 'relationships' do
      it {should have_many(:user_new_events)}
      it {should have_many(:users).through(:user_new_events)}
      it {should have_many(:comments).through(:user_new_events)}
  end
end
