class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :find_user_by_id, only: [:edit, :show, :update, :destroy,
    :correct_user]

  def index
    @users = User.activated.page(params[:page]).per(Settings.size.number_users)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "check_mail"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    if @user&.activated
      @microposts = @user.microposts.page(params[:page])
        .per(Settings.size.number_users)
    else
      redirect_to root_url
    end
  end

  def edit
    @users
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "update_success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user_deleted"
      redirect_to users_url
    else
      flash[:warning] = t "user_deleted_failed"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def correct_user
    redirect_to root_url unless @user == current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user_by_id
    @user = User.find params[:id]
  end
end
