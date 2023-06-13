class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.fund_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:email])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
end
