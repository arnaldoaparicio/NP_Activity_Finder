require 'rails_helper'

RSpec.describe 'Parks Index Page' do
  describe 'park index view' do
    before :each do
      @user = User.create!(first_name: 'wade', last_name: 'wade', state: 'DE', username: 'wade',
                           password: 'test', password_confirmation: 'test')
      visit '/login'
      fill_in :Username, with: @user.username
      fill_in :Password, with: @user.password
      click_button('Log in')
      select 'Colorado', from: :state
      click_button('Find Parks')
    end

    it ' lists all parks in the state', :vcr do
      expect('Amache National Historic Site').to appear_before("Bent's Old Fort National Historic Site")
    end

    it 'has a link to each park show page', :vcr do
      click_link("Bent's Old Fort National Historic Site")
      expect(current_path).to eq("/users/#{@user.id}/parks/beol")
    end
  end

  describe 'park index visitor' do
    it 'lists all the parks in NJ as a visitor', :vcr do
      visit('/parks?utf8=✓&state=NJ&commit=Find+Parks')

      expect(current_page).to have_content('Appalachian National Scenic Trail')
    end
  end
end
