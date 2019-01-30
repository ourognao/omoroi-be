class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def index
    if params[:q].present?
      @users = User.for_query(params[:q], params[:page] || 1)
      return
    end
    @users = User.page(params[:page])
  end
  
  def show
  end

  def create
    if params[:provider]
      @user = User.find_or_initialize_by(email: params[:email])
      if @user.id.nil?
        @user = User.new(user_params)
        @user.save
      else
        @user.errors.add(:email, :alread_exist)
      end
      return
    end
    
    @user = User.new(user_params)
    @user.confirmed_at = Time.current
    @user.save!
  end
  
  def update
    @user.update(user_params)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :provider,
      :uid,
      :name,
      :email,
      :password
    )
  end
end
