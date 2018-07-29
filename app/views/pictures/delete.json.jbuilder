if @picture.errors.any?
  json.status :error
  json.error @picture.errors
else
  json.status :success
  json.success :true
end
