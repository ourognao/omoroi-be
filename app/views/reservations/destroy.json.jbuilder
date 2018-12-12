if @reservation.errors.present?
  json.status :error
  json.errors @reservation.errors
else
  json.status :success
  json.reservation do
    json.partial! 'reservations/reservation', reservation: @reservation
  end
end
