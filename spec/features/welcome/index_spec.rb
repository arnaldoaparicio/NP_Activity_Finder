require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
    describe 'As a visitor' do
        it "can see a welcome message" do
            visit '/'
            expect(page).to have_content("Welcome")
        end

        it "can see a button to login" do
            visit '/'
            expect(page).to have_button("Login")
            click_button("Login")
            expect(current_path).to eq('/login')
        end

        it "can see a button to register" do
            visit '/'
            expect(page).to have_button("Sign Up")
            click_button("Sign Up")
            expect(current_path).to eq('/users/new')
        end

        it "can see a button to search parks", :vcr do
            visit '/'
            expect(page).to have_button("Find Parks")
            select "Colorado", from: :state
            click_button("Find Parks")
            expect(current_path).to eq('/parks')
        end

    end

    describe 'As a user' do
        before :each do
            @user = User.create!(first_name: 'wade', last_name: 'wade', state: "DE", username: "wade", password: "test", password_confirmation: "test")
            visit '/login'
            fill_in :Username, with: @user.username
            fill_in :Password, with: @user.password
            click_button("Log in")
        end
        it "can see a welcome message" do
            visit '/'
            expect(page).to have_content("Welcome")
        end

        it "can see a button to logout" do
            visit '/'
            expect(page).to have_button("Logout")
            click_button("Logout")
            expect(current_path).to eq('/')
        end

        it "can see a button to search parks", :vcr do
            visit '/'
            expect(page).to have_button("Find Parks")
            select "Colorado", from: :state
            click_button("Find Parks")
            expect(current_path).to eq("/users/#{@user.id}/parks")
        end

        it "has button to go to profile" do
            visit '/'
            expect(page).to have_button("Profile")
            click_button("Profile")
            expect(current_path).to eq("/users/#{@user.id}")
        end


    end

end