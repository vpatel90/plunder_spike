json.array!(@games) do |game|
  json.extract! game, :id, :num_players
  json.url game_url(game, format: :json)
end
