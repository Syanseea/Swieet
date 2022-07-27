# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@test.com',
  password: 'password',
  )

User.create!(
  [
   {email: 'hanako@test.com', password: 'password', name: 'hanako', introduction: 'welcome mypage', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.png"), filename:"sample-user1.png")},
   {email: 'takako@test.com', password: 'password', name: 'takako', introduction: 'hello', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")},
   {email: 'makiko@test.com', password: 'password', name: 'makiko', introduction: '初心者です！！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")},
   {email: 'utako@test.com', password: 'password', name: 'utako', introduction: '得意種目はFRです', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user4.png")},
  ]
  )

Post.create!(
  [
    {user_id: '1', title: '明日泳ぎませんか？', content: '明日の8時から2000m泳ぎます！暇な人ー？'},
    {user_id: '2', title: 'トレーニングしました！', content: '今日は、ジムで筋トレした後、1500m泳ぎました。'},
    {user_id: '3', title: 'メニュー作りました！', content: 'メニューを作ったのでぜひ見てください'},
    {user_id: '4', title: '来月の大会について', content: '来月の大会出る方いたら連絡してください'},
    {user_id: '4', title: '先ほどの追記です！！', content: '大会に向けて、合同練習を開催します。よかったらやりませんか？'},
  ]
  )
PostComment.create!(
  [
    {post_id: '1', user_id: '2', content: '行きたいです！！！'},
    {post_id: '2', user_id: '3', content: 'お疲れ様です！！'},
    {post_id: '3', user_id: '1', content: '今日はこのメニューで行きましょう'},
    {post_id: '3', user_id: '4', content: '面白そうなメニューですね'},
    {post_id: '4', user_id: '3', content: '初心者ですが参加希望です'}
  ]
  )

Favorite.create!(
  [
    {user_id: '2', post_id: '1'},
    {user_id: '3', post_id: '1'},
    {user_id: '1', post_id: '2'},
    {user_id: '3', post_id: '4'},
  ]
  )

Relationship.create!(
  [
    {follower_id: '1',followed_id: '2'},
    {follower_id: '2',followed_id: '1'},
    {follower_id: '1',followed_id: '3'},
    {follower_id: '3',followed_id: '1'},
    {follower_id: '2',followed_id: '3'},
    {follower_id: '3',followed_id: '2'},
    {follower_id: '3',followed_id: '4'},
    {follower_id: '4',followed_id: '3'},
  ]
  )

Menu.create!(
  [
    {user_id: '3', title: '体力強化', dating: '2022/07/27', is_active: 'true'},
    {user_id: '1', title: 'ゆっくり', dating: '2022/07/27', is_active: 'false'}
  ]
  )

Theme.create!(
  [
    {menu_id: '1', style: 'W-up'},
    {menu_id: '1', style: 'Kick'},
    {menu_id: '1', style: 'Down'},
    {menu_id: '2', style: 'W-up'},
    {menu_id: '2', style: 'Kick'},
    {menu_id: '2', style: 'Drill'},
    {menu_id: '2', style: 'Down'},
  ]
  )

Content.create!(
  [
    {theme_id: '1', meter: '100',repeat: '4',set: '1',second: '100',detail: 'Ba/Br/Fly/Fr'},
    {theme_id: '2', meter: '100',repeat: '4',set: '2',second: '100',detail: '1set板有,2set板無'},
    {theme_id: '3', meter: '50',repeat: '8',set: '1',second: '60',detail: 'Ch'},
    {theme_id: '3', meter: '100',repeat: '1',set: '1',second: '120',detail: 'Ch'},
    {theme_id: '4', meter: '50',repeat: '4',set: '1',second: '45',detail: 'Ba/Br/Fly/Fr'},
    {theme_id: '5', meter: '100',repeat: '2',set: '2',second: '100',detail: '呼吸制限'},
    {theme_id: '6', meter: '50',repeat: '8',set: '1',second: '60',detail: 'Ch'},
    {theme_id: '7', meter: '100',repeat: '1',set: '1',second: '120',detail: '3ストローク毎１呼吸'},

  ]
  )