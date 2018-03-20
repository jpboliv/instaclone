require "rails_helper.rb"

feature "Searching a User " do
  scenario "Search through username", :js=>true do
    user = create(:user)
    sign_in_with(user)
    fill_in("Search for a user", with: "Arnie")
    sleep(3)
  end

  scenario "Search through email",:js=>true do
    user = create(:user)
    sign_in_with(user)
    fill_in("Search for a user", with: "fancyfrank@gmail.com")
    sleep(3)
  end
end
