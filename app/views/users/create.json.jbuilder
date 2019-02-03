if @user.errors.present?
  json.status :error
  json.errors @user.errors
else
  json.status :success
  json.data do
    json.partial! 'users/user', user: @user
  end
end
