require 'rails_helper.rb'

feature 'Creating a new user' do
    background do
        #visit the home page
        #click the register link
        visit '/'
        click_link "Register"
    end
    scenario 'can create a new user via the index page' do
        #fill user name, email, password and password confirmation
        fill_in 'Email', with: "sexyrailsdev@myspace.com" 
        fill_in 'Username', with: "sexyrailsdev"
        fill_in 'Password', with: "supersecret", match: :first
        fill_in 'Confirm Password', with: "supersecret"
        #click the sign up button
        expect(page).to have_current_path(new_user_registration_path)
        click_button "Sign up"
        #expect the welcome message
        expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'requires a user name to successfully create an account' do
        #fill in the email field, password password confirmation 
        #click the sign up button
        #expect the page to have the message "you need a user name to create an account" 
        fill_in 'Email', with: "sexyrailsdev@myspace.com" 
        fill_in 'Password', with: "supersecret", match: :first
        fill_in 'Confirm Password', with: "supersecret"
        click_button "Sign up"
        expect(page).to have_content("can't be blank")
    end

    scenario 'requires a user name to be more than 4 characters' do
        fill_in 'Email', with: "sexyrailsdev@myspace.com" 
        fill_in 'Username', with: "h"
        fill_in 'Password', with: "supersecret", match: :first
        fill_in 'Confirm Password', with: "supersecret"
        click_button "Sign up"
        expect(page).to have_content("is too short (minimum is 4 characters)")
    end

    scenario 'requires a user naem to be less than 12 characters' do 
        fill_in 'Email', with: "sexyrailsdev@myspace.com" 
        fill_in 'Username', with: "h1234567991012345"
        fill_in 'Password', with: "supersecret", match: :first
        fill_in 'Confirm Password', with: "supersecret"
        click_button "Sign up"
        expect(page).to have_content("is too long (maximum is 16 characters)")
    end
end
