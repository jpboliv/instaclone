require 'rails_helper.rb'

feature 'Editing posts' do
    background do
        user = create(:user)
        post = create(:post, user: user)
        sign_in_with(user)
        find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
        click_link 'Edit'
    end

    scenario 'can edit post' do
        fill_in 'post_caption', with: "Oh god, you weren't meant to see this picture!"
        click_button 'Update Post'
        expect(page).to have_content("Your post has been updated!")
        expect(page).to have_content("Oh god, you weren't meant to see this picture!")
    end
    
    scenario "a post won't update without an attached image" do
        attach_file('post_image', 'spec/files/lol.zip')
        click_button 'Update Post'
        expect(page).to have_content("Your post couldn't be updated!")
    end
end