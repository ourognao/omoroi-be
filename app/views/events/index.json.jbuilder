json.status :success
json.data do
  json.events @events do |event|
    json.partial! 'events/event', event: event
    json.reservations event.reservations do |reservation|
      json.partial! 'reservations/reservation', reservation: reservation
    end
  end

  json.users @users do |user|
    json.partial! 'users/user', user: user
  end
end
