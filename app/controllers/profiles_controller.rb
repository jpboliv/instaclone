class ProfilesController < ApplicationController
    before_action :set_user
    before_action :authenticate_user!
    before_action :can_edit_profile, only: [:edit, :update]

    def show
        #getting user_name from url
        @posts = User.find_by(user_name: params[:user_name]).posts.order('created_at DESC')
    end

    def edit
    end

    def update
        if(@user.update(profile_params))
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
        params.require(:user).permit(:avatar,:bio)
    end

    #only the user can edit his profile
    def can_edit_profile
        unless current_user == @user
            flash[:danger] = "You can't edit other people profiles!"
            redirect_to root_path
        end
    end
end
