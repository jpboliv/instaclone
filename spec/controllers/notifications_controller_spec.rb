require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do

  describe "GET #link_through" do
    it "returns http success" do
      user = create(:user) 
      user2 = create(:user, email: 'hi@hi.com', user_name: 'supboysup')
      post = create(:post,user: user)
      notif = Notification.create :user_id => user.id, :notified_by_id => user2.id, :post_id => 1, :notice_type => "comment", :read => "false"
      get :link_through, params: {id: notif.id}
      expect(response).to have_http_status(:redirect)
    end
  end

end
