require 'rails_helper.rb'

feature 'Deleting posts' do
    background do
        user = create(:user)
        post = create(:post,caption: "Abs for days." , user: user)
        sign_in_with(user)

        #click the post to view single post
        find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
        click_link 'Edit'
    end
    
    scenario 'Can delete a post' do
        click_link 'Destroy'
        expect(page).to_not have_content("Abs for days.")
    end
end