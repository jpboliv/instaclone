class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy, :vote]
    before_action :check_ownership, only: [:edit, :update, :destroy]
 
    def index
        @posts = Post.all.order('created_at DESC').page(params[:page])
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def vote
        if current_user.liked? @post
            @post.unliked_by current_user
        else
            @post.liked_by current_user
            create_notification(@post)
        end   
        respond_to do |format|
            #format.html { render layout: !request.xhr? }
            format.html { redirect_to request.referrer }
            format.js
        end     
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Your post has been created!"
            redirect_to(post_path(@post))
        else
            flash[:danger] = "Your new post couldn't be created!"
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if(@post.update(post_params))
            flash[:success] = "Your post has been updated!"
            redirect_to(post_path(@post))
        else
            flash[:danger] = "Your post couldn't be updated!"
            render :edit
        end
    end

    def destroy
        if(@post.destroy)
            flash[:success] = "The post was successfully deleted!"
            redirect_to posts_path
        else
            flash[:danger] = "Your post couldn't be deleted!"
            render :edit
        end
    end

    private

    def post_params
        params.require(:post).permit(:image, :caption)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def check_ownership
        unless current_user == @post.user
            flash[:danger] = "You shoulnd't be editing what isn't yours!"
            redirect_to root_path
        end
    end

    def create_notification(post)
        return if post.user.id == current_user.id 
        
        Notification.create(user_id: post.user.id, notified_by_id: current_user.id, post_id: post.id, notice_type: 'like')
    end

end
