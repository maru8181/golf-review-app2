json.extract! tweet, :id, :golf_id, :point_id, :text, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
