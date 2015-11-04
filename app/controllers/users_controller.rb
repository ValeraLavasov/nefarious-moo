class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome"
      redirect_to @user
    else
      flash.now[:danger] = "Err"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end



  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
