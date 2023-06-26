require 'rails_helper'


RSpec.describe 'Parks Show Page' do
    before :each do
        @user = User.create!(first_name: 'wade', last_name: 'wade', state: "DE", username: "wade", password: "test", password_confirmation: "test")
        visit '/login'
        fill_in :Username, with: @user.username
        fill_in :Password, with: @user.password
        click_button("Log in")
        select "Colorado", from: :state
        click_button("Find Parks")
        click_link("Bent's Old Fort National Historic Site")
    end

    it "shows the park name", :vcr do
        expect(page).to have_content("Bent's Old Fort National Historic Site")
    end

    it "shows the park phone", :vcr do
        expect(page).to have_content("7193835010")
    end

    it "shows the park email", :vcr do

        expect(page).to have_content("Email: beol_interpretation@nps.gov")
    end

    xit "has form to search for events ", :vcr do 
        fill_in :start, with: "2021-03-01"
        fill_in :finish, with: "2021-03-31"
        click_button("Search")
        expect(current_path).to eq("/users/#{@user.id}/parks/beol/events")
    end

    it "shows the parks entrace fee information", :vcr do
        expect(page).to have_content("Entrance Fee Information")
        expect(page).to have_content("$10.00 per person - Adults (age 16 and older): $10.00")
        expect(page).to have_content("Free (with prior approval). See https://www.nps.gov/beol/planyourvisit/academic-fee-waiver.htm for more information.: $0.00")
    end

    it "shows parks operating hours", :vcr do   
        expect(page).to have_content("Operating Hours")
        expect(page).to have_content("Monday: 9:00AM - 4:00PM")
        expect(page).to have_content("Tuesday: 9:00AM - 4:00PM")
        expect(page).to have_content("Wednesday: 9:00AM - 4:00PM")
        expect(page).to have_content("Thursday: 9:00AM - 4:00PM")
        expect(page).to have_content("Friday: 9:00AM - 4:00PM")
        expect(page).to have_content("Saturday: 9:00AM - 4:00PM")
        expect(page).to have_content("Sunday: 9:00AM - 4:00PM")
    end

    it "shows information related to operating hours", :vcr do
        expect(page).to have_content("Operating Hours Information")
        expect(page).to have_content("The fort is open from 9:00 am to 4:00 pm, except on Thanksgiving, Christmas, and New Year's Day, when the fort will be closed. The gate is open from 7:00 am to 4:00 pm, except on Thanksgiving, Christmas, and New Year's Day.")
    end



    
end