json.status :success
json.data do
  json.events @events do |event|
    json.partial! 'events/event', event: event
  end

  json.users @users do |user|
    json.partial! 'users/user', user: user
  end
end
