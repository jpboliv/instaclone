class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :check_ownership, only: [:edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Your post has been created!"
            redirect_to posts_path
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
            flash[:danger] = "YOU SHOULDN'T BE HERE BOY!"
            redirect_to root_path
        end
    end
end
