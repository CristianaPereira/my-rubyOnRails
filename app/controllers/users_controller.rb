class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show ]

  def show
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User was successfully created. Welcome, #{@user.username}"
      redirect_to home_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
    flash[:notice] = "User was updated successfully."
    redirect_to @user
    else
    render :edit, status: :unprocessable_entity
    end
  end


  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password) # :password_confirmation
  end
end
