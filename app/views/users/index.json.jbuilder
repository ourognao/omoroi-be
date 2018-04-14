json.status :success
json.data do
  json.users @users do |user|
    json.partial! 'users/user', user: user
  end
  json.totalPages @users.total_pages
end
