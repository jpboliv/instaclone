require 'rails_helper.rb'

feature 'Searching a User ', js: true do
  scenario 'Search through username' do
    user = create(:user)
    sign_in_with(user)
    fill_in('Search for a user', with: 'Arnie')
  end

  scenario 'Search through email' do
    user = create(:user)
    sign_in_with(user)
    fill_in('Search for a user', with: 'fancyfrank@gmail.com')
  end
end
