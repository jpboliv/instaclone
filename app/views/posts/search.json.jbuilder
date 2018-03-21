json.users do
  json.array!(@users) do |user|
    json.user_name user.user_name
    json.email user.email
    json.url profile_path(user)
  end
end
