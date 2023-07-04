require 'rails_helper'

RSpec.describe UserNewPark, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :new_park_id }
  it { should belong_to :user }
  it { should belong_to :new_park }
end
