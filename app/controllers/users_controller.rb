class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["first_name"] = params["user"]["first_name"]
    @user["last_name"] = params["user"]["last_name"]
    @user["email"] = params["user"]["email"]
    @user["password"] = BCrypt::Password.create(params["user"]["password"])
        
    if User.exists?("email" => @user["email"])
      flash["notice"] = "User ID already exists"
    else
      flash["notice"] = "Welcome to Tacogram"
      @user.save      
    end
    
    redirect_to "/posts"
  end
end
