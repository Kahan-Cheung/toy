class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.where('name LIKE ?',  "%#{params[:search]}%")
                    .paginate :page => params[:page],
                              :per_page => 10
    @count_allusers = User.all.count
  end
  
  def show
    @user = User.find(params[:id])
    @menbers = @user.menbers.paginate(page: params[:page])
    @leader_menbers = []
    @menbers.each do |m|
      if m.authority==1
        @leader_menbers << m
      end
    end
    #debugger
  end
 
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  # 确保用户已登录
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  # 确保是正确的用户
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # 确保是管理员
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, 
                                    :academy,:password_confirmation)
    end
  
end
