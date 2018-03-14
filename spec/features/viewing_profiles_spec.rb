require "rails_helper.rb"

feature "Viewing Profile " do
    background do
        user = create(:user)
        post = create(:post, user: user)
        sign_in_with(user)
        visit '/'
        first('.user-name').click_link 'Arnie'
        
    end
    scenario "visiting a profile page shows the user name in the url" do
        expect(page).to have_current_path("/Arnie")
    end

    scenario "a profile page only shows the specified users post" do
        user2 = create(:user, email: 'hi@hi.com', user_name: 'supboysup')
        post2 = create(:post,user: user2, caption: "SUP BITCH")
        expect(page).to_not have_content("SUP BITCH")
        expect(page).to have_content("#nofilter")
    end
end