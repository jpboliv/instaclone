require 'rails_helper.rb'

feature "Viewing individual post" do
    background do
        user = create(:user)
        post = create(:post, user: user)
        sign_in_with(user)

    end
    scenario 'can click and view a post, from index' do
        find(:xpath, "//a[contains(@href,'posts/1')]", match: :first).click
        expect(page.current_path).to eq(post_path(1))
    end
end