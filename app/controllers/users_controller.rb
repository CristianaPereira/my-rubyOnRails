class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show, :destroy ]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
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

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  private


  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "User not found"
    redirect_to home_path
  end

  def user_params
    params.require(:user).permit(:username, :email, :password) # :password_confirmation
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = "You can only edit your own account"
      redirect_to @user
    end
  end
end
