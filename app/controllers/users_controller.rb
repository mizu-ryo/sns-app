class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:index, :edit, :update, :destroy,
                                         :following, :followers, :iines]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      #保存の成功をここで扱う。
      flash[:success] = "Welcome to the SNS App"
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
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title  = "Following"
    @user   = User.find(params[:id])
    @users  = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title  = "Followers"
    @user   = User.find(params[:id])
    @users  = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def iines
    @title  = "Iines"
    @user   = User.find(params[:id])
    @iines  = @user.iine_posts.paginate(page: params[:page], per_page: 5)
    render 'show_iine'
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # beforeアクション

    # ログイン済みユーザーかどうか確認
#   def logged_in_user
#    unless logged_in?
#      store_location
#      flash[:danger] = "Please log in."
#      redirect_to login_url
#    end
#  end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
