# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

USER_NUM = 100
TWEET_NUM = 1000
LIKE_NUM = 500

start_day = Date.new(2010, 1, 1)
last_day = Date.new(1960, 1, 1)


(1..USER_NUM).each do |idx|
  random_birthday =  rand(start_day..last_day)
  user_params = {name: "user#{idx}", birthday: random_birthday}
  User.create(user_params)
end

(1..TWEET_NUM).each do |idx|
  user_id = Random.rand(0..USER_NUM-1)
  tweet_params = {text: "tweet#{idx}", user_id: user_id}
  Tweet.create(tweet_params)
end

(1..LIKE_NUM).each do |idx|
  user_id = Random.rand(0..USER_NUM-1)
  tweet_id = Random.rand(0..TWEET_NUM-1)
  if Like.where({user_id: user_id, tweet_id: tweet_id}).length == 0
    Like.create({user_id: user_id, tweet_id: tweet_id})
  end
end