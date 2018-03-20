require 'rails_helper.rb'

feature "Viewing individual post" do
    scenario 'can click and view a post, from index' do
        user = create(:user)
        post = create(:post, user: user)
        sign_in_with(user)
        find(:xpath, "//a[contains(@href,'posts/#{post.id}')]", match: :first).click
        expect(page.current_path).to eq(post_path(post.id))
    end
end
