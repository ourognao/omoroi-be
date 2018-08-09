if @event.errors.present?
  json.status :error
  json.errors @event.errors
else
  json.status :success
  json.data do
    json.partial! 'events/event', event: @event
  end
end
