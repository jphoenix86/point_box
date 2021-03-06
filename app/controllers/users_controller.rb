class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      # insert sad path here
    end
  end

  def show
    @user = User.find(params[:id])
    @rewards = @user.rewards
  end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
