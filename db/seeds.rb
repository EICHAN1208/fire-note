50.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    password: "password",
    created_at: '2020-04-30 12:00:01.139093',
    updated_at: '2020-04-30 12:00:01.139093'
  )
end

User.all.each do |user|
  user.articles.create!(
    title: 'タイトル',
    kind: '火災',
    summary: 'がいようがいようがいようがいよう',
    content: 'かつどうかつどうかつどうかつどう'
  )
end

users = User.all
user  = users.first
followers = users[2..50]
followings = users[3..40]
followers.each { |followed| user.followed_by?(followed) }
followings.each { |follower| follower.followed_by?(user) }
