json.status :success
json.data do
  json.pictures @pictures do |picture|
    json.partial! 'pictures/picture', picture: picture
  end
end

