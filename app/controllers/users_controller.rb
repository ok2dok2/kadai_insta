class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
      @user = User.new(user_pamrams)
      if  @user.save
        redirect_to user_path(@user.id)
      else
        render :new
      end
    end

    private
    
    def user_pamrams
      params.require(:user).params(:name, :email, :password, :password_confirmation)
    end
  end
