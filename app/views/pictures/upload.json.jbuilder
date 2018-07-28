case @pictureType
  when :event
    if @picture.errors.any?
      json.status :error
      json.error @error
    else
      json.status :success
      json.success :true
      json.id @picture.id
    end
end
