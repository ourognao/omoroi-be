json.status :success
json.data do
  json.reservations @reservations do |reservation|
    json.partial! 'reservations/reservation', reservation: reservation
  end
  json.totalPages @reservations.total_pages
end
