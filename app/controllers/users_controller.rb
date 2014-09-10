class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    return render "errors/404" unless current_user

    render "errors/404"  unless session[:user_id] == current_user.id
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = 'Welcome to TravelHome!'
      redirect_to @user
    else
      render :new
    end
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name,
                                   :username,   :email,
                                   :city,       :state,
                                   :password,   :password_confirmation)
  end
end
