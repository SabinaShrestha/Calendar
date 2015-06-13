class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_path, notice: 'someting')
    else
      flash[:alter] = "Couldn't save  the event try again..."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end