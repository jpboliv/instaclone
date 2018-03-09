require 'rails_helper.rb'

feature 'Creating comments' do
    scenario 'can create new comment' do
        user = create(:user)
        post = create(:post, user: user)
        sign_in_with(user)
        visit '/' 
        fill_in "comment_content_#{post.id}", with: ";P\n"
        #fill_in "", with: ";P"
        #detects keyboard return click
        expect(page).to have_content(";P")
    end
end