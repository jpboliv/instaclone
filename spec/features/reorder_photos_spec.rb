# require "rails_helper.rb"

# feature "Ordering Profile Photos" do
#   background do
#     user = create(:user)
#     post = create(:post, user: user)
#     post2 = create(:post, user: user)
#     post3 = create(:post, user: user)
#     sign_in_with(user)
#     visit '/' 
#     click_on(class: 'glyphicon glyphicon-heart-empty', :match => :first)    
#   end

#   # scenario "Ordering posts by likes" do 
#   #   first('.user-name').click_link 'Arnie' 
#   #   find('#ordertype').find(:xpath, 'option[2]').select_option
#   # end
  
#   # scenario "Ordering posts by date" do 
#   # end
  
#   # scenario "Ordering posts by comments" do 
#   # end

#   scenario "There is no orderbox on favourites", js: true do
#     first('.user-name').click_link 'Arnie' 
#     find('#most-liked-tab').click
#     #save_screenshot("capybara-js.png")
#     page.evaluate_script("function() { $('#order-box').remove(); }")
#     save_screenshot("capybara2-js.png")
#     #expect(page).to_not have_content("Order By:")
#   end
# end