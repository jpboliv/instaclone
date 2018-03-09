require 'rails_helper.rb'

feature 'User authentication' do
    background do
        user = create(:user)
        #sign_in_with(user)
    end

    scenario 'can log in from the index via dynamic navbar' do
        #visit the index
        visit '/'
        # #expect the page to not have the 'new post' link yet
        expect(page).to_not have_content('New Post')
        click_link 'Login'
        fill_in 'username', with: 'Arnie'
        fill_in 'password', with: 'illbeback'
        click_button 'Log in'
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("New Post")
        expect(page).to have_content("Logout")
        expect(page).to_not have_content('Register')
    end

    scenario 'can log out once logged in' do
        visit '/' 
        click_link 'Login'
        fill_in 'username', with: 'Arnie'
        fill_in 'password', with: 'illbeback'
        click_button 'Log in'
        click_link 'Logout'
        expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    scenario 'cannot view index posts whithout loggin in' do 
        visit '/'
        expect(page).to have_content("You need to sign in or sign up before continuing.")
    end

    scenario 'cannot create a new post without loggin in' do
        visit '/posts/new'
        expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
end