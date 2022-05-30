class PostsController < ApplicationController

    def index
      @posts = Post.all
    end
  
    def new
      if @current_user
        @post = Post.new
      else
        flash["notice"] = "Login to Post"
        redirect_to "/sessions/new"
      end
    end
  
    def create
        @post = Post.new
        @post["body"] = params["post"]["body"]
        @post["image"] = params["post"]["image"]
        @post["user_id"] = session["user_id"]
        @post.save
        redirect_to "/posts"
    end
  
  end