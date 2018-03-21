require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'User receives notification' do
  scenario 'User receives notification when other user comments his post' do 
    user = create(:user)
    user2 = create(:user, email: 'hi@hi.com', user_name: 'supboysup')
    post = create(:post,user: user)
    sign_in_with(user2)
    visit '/'   
    fill_in "comment_content_#{post.id}", with: ";P"
    click_button "New Comment"
    click_link "Logout"
    sign_in_with(user)
    click_on(class: "btn btn-default dropdown-toggle")
    expect(page).to have_content("Notifications")
    click_link "View All"
    expect(page).to have_current_path("/notifications")
    expect(page).to have_content("supboysup left a comment on your post")
  end

  scenario 'User receives notification when other user comments likes post' do
    user = create(:user)
    user2 = create(:user, email: 'hi@hi.com', user_name: 'supboysup')
    post = create(:post,user: user)
    sign_in_with(user2)
    visit '/'  
    click_on(class: 'glyphicon glyphicon-heart-empty') 
    click_link "Logout"
    sign_in_with(user)
    click_on(class: "btn btn-default dropdown-toggle")
    expect(page).to have_content("Notifications")
    click_link "View All"
    expect(page).to have_content("supboysup has liked your post")
  end

  scenario 'User does not receive notification when he comments/likes his own post' do
    user = create(:user)
    post = create(:post,user: user)
    sign_in_with(user)
    fill_in "comment_content_#{post.id}", with: ";P"
    click_button 'New Comment'
    click_on(class: 'glyphicon glyphicon-heart-empty')
    click_on(class: "btn btn-default dropdown-toggle")
    expect(page).to have_content("Notifications")
    click_link "View All"
    expect(page).to_not have_content("supboysup has liked your post")
    expect(page).to_not have_content("supboysup left a comment on your post")
  end

  scenario 'Notification disapears when read' do
    user = create(:user)
    user2 = create(:user, email: 'hi@hi.com', user_name: 'supboysup')
    post = create(:post,user: user)
    sign_in_with(user2)
    visit '/'   
    click_on(class: 'glyphicon glyphicon-heart-empty')
    click_link "Logout"
    sign_in_with(user)
    click_on(class: "btn btn-default dropdown-toggle")
    click_link "View All"
    find(:xpath, "//a[contains(@href,'notifications/1/link_through')]", match: :first).click
    expect(page).to have_current_path("/posts/#{post.id}")
    click_on(class: "btn btn-default dropdown-toggle")
    click_link "View All"
    expect(page).to_not have_content("supboysup has liked your post")
  end

end
