class CommentsController < ApplicationController

    def create
        @comment = Comment.new
        @comment["contact_id"] = params["comment"]["contact_id"]
        @comment["comment"] = params["comment"]["comment"]
        @comment["user_id"] = @current_user["id"]
        @comment.save
        redirect_to "/posts/#{@current_user["user_id"]}"
    end
    

end
