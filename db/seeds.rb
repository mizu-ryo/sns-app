# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザー作成
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "ubuntu",
             password_confirmation: "ubuntu" )

User.create!(name:  "Mizu",
             email: "mizu@sample.com",
             password:              "ubuntu",
             password_confirmation: "ubuntu",
             admin: true )

User.create!(name:  "ryosuke",
             email: "mukusuke421@gmail.com",
             password:              "ubuntu",
             password_confirmation: "ubuntu" )

# User.create!(name:  "mouse",
#              email: "mouse@sample.com",
#              password:              "ubuntu",
#              password_confirmation: "ubuntu" )

# User.create!(name:  "A.A.",
#              email: "aa@sample.com",
#              password:              "ubuntu",
#              password_confirmation: "ubuntu" )

# User.create!(name:  "B.B.",
#              email: "bb@sample.com",
#              password:              "ubuntu",
#              password_confirmation: "ubuntu",
#              admin: true )

# User.create!(name:  "C.C.",
#              email: "cc@sample.com",
#              password:              "ubuntu",
#              password_confirmation: "ubuntu" )

5.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "ubuntu"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
end

# ポスト作成
users = User.all
10.times do 
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.posts.create!(content: content)}
end

# user = User.first
# 20.times do 
#     content = Faker::Lorem.sentence(5)
#     user.posts.create!(content: content)
# end

# リレーションシップ
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) } 

# コメント作成
# comment1 = "comment1!"
# comment2 = "comment2!"
# User.find(2).comments.create(content:comment1, post_id:Post.first.id )
# User.find(2).comments.create(content:comment2, post_id:Post.first.id )
