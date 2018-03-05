class CommentsController < ApplicationController
    before_action :set_post 

    def create 
        @comment = @post.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:success] = "Your comment has been created!"
            redirect_to :back
        else
            flash[:danger] = "Your new comment couldn't be created!"
            redirect_to root_path
        end
    end

    def destroy
        @comment = @post.comments.build(comment_params)
        if(@comment.destroy)
            flash[:success] = "The comment was successfully deleted!"
            redirect_to root_path
        else
            flash[:danger] = "Your comment couldn't be deleted!"
        end
    end

    private
    def comment_params
        params.require(:post).permit(:content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
