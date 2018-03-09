require 'rails_helper.rb'

feature 'User authentication' do
    background do
        #create our user factory
        user = create(:user)
    end

    scenario 'can log in from the index via dynamic navbar' do
        #visit the index
        visit '/'
        #expect the page to not have the 'new post' link yet
        expect(page).to_not have_content('New Post')
        click_link 'Login'
        fill_in 'username', with: 'Arnie'
        fill_in 'password', with: 'illbeback'
        click_button 'Log in'
        expect(page).to have_content("Signed in successfully.")
    end
end