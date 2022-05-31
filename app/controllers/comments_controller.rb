class CommentsController < ApplicationController

    def new
        @comment = Comment.new
        @comment["post_id"] = params["post_id"]
    end

    def create
        @comment = Comment.new
        @comment["post_id"] = params["comment"]["post_id"]
        @comment["comment"] = params["comment"]["comment"]
        @comment["user_id"] = @current_user["id"]
        @comment.save
        redirect_to "/posts"
    end
    

end
