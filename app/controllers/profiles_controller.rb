class ProfilesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!
  before_action :can_edit_profile, only: %i[edit update]
  
  def show
    @orders = ["Comments", "Likes", "Date"]
    user = User.find_by(user_name: params[:user_name])
    @posts = user.posts.order('created_at DESC')
    # top 10 most liked posts from user
    @most_liked_posts = user.posts.where('cached_votes_up > ?', 0).order('cached_votes_up DESC').first(10)
  end

  def update_posts_order
    user = User.find_by(user_name: params[:user_name])
    case params[:type_order]
    when "Likes" then @posts = user.posts.order('cached_votes_up DESC')
    when "Date" then @posts = user.posts.order('created_at DESC') 
    else 
      @posts = user.posts.sort_by(&:count_comments).reverse
    end
  end

  def edit; end

  def update
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated!'
      redirect_to profile_path(@user.user_name)
    else
      flash[:danger] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  # only the user can edit his profile
  def can_edit_profile
    unless current_user == @user
      flash[:danger] = "You can't edit other people profiles!"
      redirect_to root_path
    end
  end
end
