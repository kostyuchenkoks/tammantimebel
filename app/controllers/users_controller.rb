class UsersController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Проверьте вашу почту для активации аккаунта."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Профиль обновлен"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to users_url
  end

  private
  
    def user_params
      #params.require(:user).permit(:name, :email, :password,
                                   #:password_confirmation)
      params.require(:user).permit(:last_name, :name, :middle_name, :email, :phone,
          :city, :address, :password, :password_confirmation)
    end

    # Предварительные фильтры

    # Подтверждает вход пользователя.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Пожалуйста, войдите."
        redirect_to login_url
      end
    end

    # Подтверждает права пользователя.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Подтверждает наличие административных привилегий.
    def admin_user
      unless logged_in? && current_user.admin?
        redirect_to(root_url)
      end 
    end
end
