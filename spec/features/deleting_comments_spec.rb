require 'rails_helper.rb'

feature "Deleting Comments" do 

    scenario "User deletes his own comment" do
        user = create(:user)
        post = create(:post,caption: "Abs for days." , user: user)
        comment = create(:comment, user: user, post: post)
        sign_in_with(user)
        visit '/'
        expect(page).to have_content('Nice post')
        click_link 'delete-1'
        expect(page).to_not have_content('Nice post')
    end

    scenario "User tries to delete other users comment" do
        user = create(:user)
        post = create(:post,caption: "Abs for days." , user: user)
        comment = create(:comment, user: user, post: post)
        user2 = create(:user, email: 'hi@hi.com', user_name: 'supboysup')
        comment_two = create(:comment,post: post, content: 'Sup dude', user: user2)
        sign_in_with(user2)
        visit '/'
        expect(page).to have_content('Nice post')
        expect(page).to have_content('Sup dude')
        expect(page).to_not have_css('#delete-1')
    end
end
