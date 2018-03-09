require 'rails_helper'

feature 'Creating posts' do
    background do
        user = create(:user)
        post = create(:post, user: user)
        sign_in_with(user)
    end
    
    scenario 'can create a new post' do
        visit '/'
        click_link 'New Post'
        attach_file('post_image', "spec/files/images/coffee.jpg")
        fill_in 'Add your caption', with: "nom nom nom #coffeetime"
        click_button 'Create Post'
        expect(page).to have_content("#coffeetime")
        expect(page).to have_css("img[src*='coffee']")
    end

    scenario 'a post needs an image to save' do
        visit '/'
        click_link 'New Post'
        fill_in 'Add your caption', with: "No picture because YOLO"
        click_button 'Create Post'
        expect(page).to have_content("can't be blank")
    end
end