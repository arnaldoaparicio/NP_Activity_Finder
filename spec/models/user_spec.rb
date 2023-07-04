require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :password_digest }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :username }
    it { should validate_presence_of :state }
  end

  describe 'relationships' do
    it { should have_many(:user_new_events) }
    it { should have_many(:new_events).through(:user_new_events) }

    it { should have_many(:user_new_parks) }
    it { should have_many(:new_parks).through(:user_new_parks) }
  end
end
