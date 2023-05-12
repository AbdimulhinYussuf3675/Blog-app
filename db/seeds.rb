# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

# User seeder
user_1 = User.create(name: 'Hassan', photo: "https://www.mlive.com/resizer/UEaVb0UEZ-FOOmU5sH-jaAPzEgI=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/ETSJBFFEBNBCDG6BVGJWPZMVPI.jpg", bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pellentesque ex vitae velit auctor volutpat. Phasellus eget nisl maximus, tristique odio nec, porta arcu. Quisque fermentum viverra sodales. Curabitur commodo, turpis at volutpat blandit, urna felis tincidunt erat, ac porta.', posts_counter: 0)
user_2 = User.create(name: 'Adam', photo: "https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png", bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pellentesque ex vitae velit auctor volutpat. Phasellus eget nisl maximus, tristique odio nec, porta arcu. Quisque fermentum viverra sodales. Curabitur commodo, turpis at volutpat blandit, urna felis tincidunt erat, ac porta.', posts_counter: 0)
user_3 = User.create(name: 'Nadhiph', photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiyPxG7CbeaEhh9Rk879l8ke37lSXnpkV8xQ&usqp=CAU", bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pellentesque ex vitae velit auctor volutpat. Phasellus eget nisl maximus, tristique odio nec, porta arcu. Quisque fermentum viverra sodales. Curabitur commodo, turpis at volutpat blandit, urna felis tincidunt erat, ac porta.', posts_counter: 0)

p "Created #{User.count} Users"

# Post seeder
post_1 = Post.create(author: user_1, title: 'Post 1', text: 'One Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.', comments_counter: 0, likes_counter: 0)
post_2 = Post.create(author: user_2, title: 'Post 2', text: 'Two Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.', comments_counter: 0, likes_counter: 0)
post_3 = Post.create(author: user_1, title: 'Post 3', text: 'Three Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.', comments_counter: 0, likes_counter: 0)
post_4 = Post.create(author: user_2, title: 'Post 4', text: 'Four Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.', comments_counter: 0, likes_counter: 0)
post_5 = Post.create(author: user_3, title: 'Post 5', text: 'Three Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.', comments_counter: 0, likes_counter: 0)

p "Created #{Post.count} Posts"

# Comment seeder
Comment.create([
                 { post: post_1, author: user_1, text: 'User 1 comment in post 1' },
                 { post: post_2, author: user_2, text: 'User 2 comment in post 2' },
                 { post: post_3, author: user_1, text: 'User 1 comment in post 3' },
                 { post: post_4, author: user_2, text: 'User 2 comment in post 4' },
                 { post: post_1, author: user_1, text: 'User 1 comment in post 1' },
                 { post: post_2, author: user_2, text: 'User 2 comment in post 2' },
                 { post: post_5, author: user_3, text: 'User 2 comment in post 2' }
               ])

p "Created #{Comment.count} Comments"

# Like seeder
Like.create([
  { post: post_1, author: user_1 },
  { post: post_2, author: user_2 },
  { post: post_3, author: user_1 },
  { post: post_4, author: user_2 }
])

p "Created #{Like.count} Likes"
