# TODO:
# Adding mock data using seeds.rb possibly not a best practice, look into
# creating a rake task
# https://www.reddit.com/r/rails/comments/143j24q/seeding_the_db_best_approach/

10.times do
  User.create!(email: Faker::Internet.email,
               password: 'password123',
               pets_name: Faker::Creature::Dog.name)
end

# u1 requests u2 (confirmed)
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(2),
                      confirmed: true)
# u1 requests u3
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(3))

# u4 requests u1 (confirmed)
FriendRequest.create!(sender: User.find(4),
                      recipient: User.find(1),
                      confirmed: true)
# u5 requests u1
FriendRequest.create!(sender: User.find(4),
                      recipient: User.find(1))

Post.create!([
               { author: User.find(1),
                 postable: TextContent.create!(content: 'A cool text post.') },
               { author: User.find(1),
                 postable: PhotoContent.create!(content: 'A cool photo post.') },
               { author: User.find(1),
                 postable: TextContent.create!(content: 'A cool text post.') },
               { author: User.find(1),
                 postable: PhotoContent.create!(content: 'A cool photo post.') },
               { author: User.find(1),
                 postable: TextContent.create!(content: 'A cool text post.') },
               { author: User.find(1),
                 postable: PhotoContent.create!(content: 'A cool photo post.') },
               { author: User.find(1),
                 postable: TextContent.create!(content: 'A cool text post.') },
               { author: User.find(1),
                 postable: PhotoContent.create!(content: 'A cool photo post.') },
             ])

# Nested comments
# u = User.last
# u.posts.create!(postable: TextContent.create!(content: 'My first post'))
# u.posts.find_by(postable_type: 'TextContent').comments.create!(author_id: 1, content: 'My first comment under a text post')
# textpost_comment_first_layer = Comment.last
# textpost_comment_first_layer.comments.create!(author_id: 1, content: 'A comment under a comment (text post)')
# textpost_comment_2nd_layer = Comment.last
# textpost_comment_2nd_layer.comments.create!(author_id: 1, content: 'This comment is 3 layers deep (text post)')
# textpost_comment_3rd_layer = Comment.last

# u.posts.create!(postable: PhotoContent.create!(content: 'My first post'))
# u.posts.find_by(postable_type: 'PhotoContent').comments.create!(author_id: 1, content: 'My first comment under a photo post')
# photopost_comment_first_layer = Comment.last
# photopost_comment_first_layer.comments.create!(author_id: 1, content: 'A comment under a comment (photo post)')
# photopost_comment_2nd_layer = Comment.last
# photopost_comment_2nd_layer.comments.create!(author_id: 1, content: 'This comment is 3 layers deep (photo post)')
# photopost_comment_3rd_layer = Comment.last
