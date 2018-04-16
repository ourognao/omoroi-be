class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:create, :update, :destroy]
  
  def index
    @reservations = Reservation.page(params[:page])
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save!
  end
  
  def update
    @reservation.update(reservation_params)
  end

  def destroy
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :id,
      :event_id,
      :user_id,
      :expected_people
    )
  end

  def set_reservation
    @user         = User.find_by(email: params[:email]) if params[:email].present?
    @reservation  = Reservation.find(params[:id]) if params[:id].present?
  end
end
