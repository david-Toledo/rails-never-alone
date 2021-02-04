# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating users....."

User.destroy_all

user1 = User.create! name:'David', email:'david@ga.co', password:'chicken', address:'30 Hannan street Maroubra NSW', admin:true, user_active:true, user_type:1, about:"friendly and outgoing"

user2 = User.create! name:'John', email:'john@ga.co', password:'chicken', address:'100 Anzac Parade Maroubra NSW', admin:false, user_active:true, user_type:0, about:"I like coffee and walking on the park"

user3 = User.create! name:'Kyle', email:'kyle@ga.co', password:'chicken', address:'562 Crown street  NSW', admin:false, user_active:true, user_type:1, about:"I enjoy reading sci-fi books"

user4 = User.create! name:'Stacey', email:'stacey@ga.co', password:'chicken', address:'1 york street Sydney CBD', admin:false, user_active:false, user_type:0, about:"I like horror movies and love popcorn"

puts "created users: #{User.count}"


puts "creating posts....."

Post.destroy_all

post1 = Post.create! title:'help needed on Friday 14th Feb', body:'anyone who can take me to lunch?', user_id:user1.id

post2 = Post.create! title:'I need someone to talk to for about an hour', body:'looking for anyone this week', user_id:user2.id

post3 = Post.create! title:'help in Maroubra', body:'anyone who can help me with some shopping?', user_id:user3.id

post4 = Post.create! title:'lunch or dinner please', body:'anyone available for a meal?', user_id:user4.id

puts "created posts: #{Post.count}"



puts "creating responses....."

Response.destroy_all

response1 = Response.create! body:"sure, I can come later this week to Zetland", post_id:post1.id, user_id:user2.id

response2 = Response.create! body:"what time is suitable for you?", post_id:post1.id, user_id:user3.id

response3 = Response.create! body:"I am free!", post_id:post2.id, user_id:user4.id

response4 = Response.create! body:"sure, I am strong enough to carry some shopping bags", post_id:post3.id, user_id:user1.id


puts "created responses: #{Response.count}"
