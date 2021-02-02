# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating users....."

User.destroy_all

user1 = User.create! name:'David', email:'david@ga.co', password:'chicken', address:'1 hannan street Maroubra', admin:true, user_active:true, user_type:1, about:"friendly and outgoing"

user2 = User.create! name:'John', email:'john@ga.co', password:'chicken', address:'20 hannan street Maroubra', admin:false, user_active:true, user_type:0, about:"I like coffee and walking on the park"

user3 = User.create! name:'Kyle', email:'kyle@ga.co', password:'chicken', address:'40 hannan street Maroubra', admin:false, user_active:true, user_type:1, about:"I enjoy reading sci-fi books"

user4 = User.create! name:'Stacey', email:'stacey@ga.co', password:'chicken', address:'60 hannan street Maroubra', admin:false, user_active:false, user_type:0, about:"I like horror movies and love popcorn"

puts "created users: #{User.count}"


puts "creating posts....."

Post.destroy_all

post1 = Post.create! title:'help in Zetland', body:'anyone out there?', user_id:user1.id

post2 = Post.create! title:'help in Maroubra', body:'anyone free?', user_id:user2.id

post3 = Post.create! title:'help in Sydney CDB', body:'anyone who can help me with some shopping?', user_id:user3.id

post4 = Post.create! title:'help in Maroubra', body:'anyone available for a meal?', user_id:user4.id

puts "created posts: #{Post.count}"



puts "creating responses....."

Response.destroy_all

response1 = Response.create! body:"sure, I can come later this week to Zetland", post_id:post1.id, user_id:user2.id

response2 = Response.create! body:"what time is suitable for you?", post_id:post1.id, user_id:user3.id

response3 = Response.create! body:"I am free!", post_id:post2.id, user_id:user4.id

response4 = Response.create! body:"sure, I am strong enough to carry some shopping bags", post_id:post3.id, user_id:user1.id


puts "created responses: #{Response.count}"
