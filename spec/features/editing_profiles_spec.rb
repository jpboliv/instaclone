require "rails_helper.rb"

feature "Editing Profiles" do
    background do
        user = create(:user)
        user2 = create(:user, email: 'hi@hi.com', user_name: 'supboysup')
        post = create(:post,user: user)
        post2 = create(:post, user: user2)
        sign_in_with(user)
        visit '/'     
    end
    
    scenario "a user can change their own profile" do
        expect(page).to have_content("#nofilter")
        first(:link, 'Arnie').click
        click_link "Edit Profile"
        attach_file('user_avatar', 'app/assets/images/bgimage2.jpg')
        fill_in "user_bio", with: "new caption bro"
        click_button "Update Profile"
        expect(page).to have_current_path("/Arnie")
        expect(page).to have_content("Your profile has been updated!")
        expect(page).to have_content("new caption bro")
    end

    scenario "a user cannot change someone elses profile" do
        first(:link, 'supboysup')
        expect(page).to_not have_content("Edit Profile")
    end

    scenario "a user cannot navigate directly to edit a users profile" do
        visit('/supboysup/edit')
        expect(page).to have_content("You can't edit other people profiles!")
        expect(page).to have_current_path("/")
    end
end
