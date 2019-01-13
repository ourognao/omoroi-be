if @releaseEmails.errors.present?
  json.status :error
  json.errors @releaseEmails.errors
else
  json.status :success
end
