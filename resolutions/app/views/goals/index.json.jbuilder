json.array!(@goals) do |goal|
  json.extract! goal, :id, :title, :user_id, :access
  json.url goal_url(goal, format: :json)
end
