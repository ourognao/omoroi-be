json.status :success
json.data do
  json.events @events do |event|
    json.partial! 'events/event', event: event
    json.reservations event.reservations do |reservation|
      json.partial! 'reservations/reservation', reservation: reservation
    end
    json.thumbnail event.event_pictures[0]&.thumbnail
  end

  json.staff @staff do |staff|
    json.partial! 'events/staff', staff: staff
  end
  
  json.totalPages @totalPages
end
