class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path(@user_id),notice: '新規アカウントを作成しました'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @feeds = Feed.all
    @favorites = current_user.favorites.all
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
