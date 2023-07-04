require 'rails_helper'

RSpec.describe NewPark, type: :model do
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
    it { should have_many(:user_new_parks) }
    it { should have_many(:users).through(:user_new_parks) }
  end
end
