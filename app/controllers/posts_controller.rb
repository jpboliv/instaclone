class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        if(@post.valid?)
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
end
