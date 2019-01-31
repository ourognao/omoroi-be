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
    @user = User.find_or_initialize_by(email: params[:user][:email])
    @user.id.nil? ? save_user : @user.errors.add(:email, :already_exist)
  end
  
  def update
    @user.update(user_params)
  end

  def invalid_omniauth_session
    User.find_by(email: params[:email]).update(uprovider: nil)
  end

  private

  def save_user
    @user = User.new(user_params)
    @user.confirmed_at = Time.current
    @user.save!
  end
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :uprovider,
      :name,
      :email,
      :password
    )
  end
end
