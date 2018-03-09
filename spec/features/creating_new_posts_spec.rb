require 'rails_helper.rb'

feature 'Creating posts' do
    background do
        user = create(:user)
        sign_in_with user
    end
    scenario 'can create a post' do
        visit '/posts/new'
        #click_link 'New Post'
        attach_file('Image', "spec/files/images/coffee.jpg")
        fill_in 'Caption', with: 'nom nom nom #coffeetime'
        click_button 'Create Post'
        expect(page).to have_content('#coffeetime')
        expect(page).to have_css("img[src*='coffee.jpg']")
    end
end


