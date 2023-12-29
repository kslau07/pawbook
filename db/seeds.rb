# frozen_string_literal: true

# TODO:
# Adding mock data using seeds.rb possibly not a best practice, look into
# creating a rake task
# https://www.reddit.com/r/rails/comments/143j24q/seeding_the_db_best_approach/

3.times do |n|
  n += 1
  User.create!(email: "test_user#{n}@example.com",
               username: "test_user#{n}",
               password: 'password123')
end

4.times do |n|
  n += 1
  User.create!(email: Faker::Internet.email,
               username: "faker_user#{n}",
               password: 'password123')
end

# user1 confirmed friends
# user1 -> user2
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(2),
                      confirmed: true)
# user3 -> user1
FriendRequest.create!(sender: User.find(3),
                      recipient: User.find(1),
                      confirmed: true)

# Unconfirmed requests
# user1 -> user4
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(4),
                      confirmed: false)
# user1 -> user7
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(7),
                      confirmed: false)
# user5 -> user1
FriendRequest.create!(sender: User.find(5),
                      recipient: User.find(1),
                      confirmed: false)
# user6 -> user1
FriendRequest.create!(sender: User.find(6),
                      recipient: User.find(1),
                      confirmed: false)

def random_time(type)
  if type == 'past'
    rand(0..1_000_000).minutes.ago
    # rand_date = rand(3..60).days.ago
  elsif type == 'future'
    rand(0..1_000_000).minutes.from_now
  end
end

2.times do |_n|
  random_past = random_time('past')
  random_user = User.find(rand(1..User.count))
  postable_types = [TextContent, PhotoContent]
  Post.create!([
                     { author: random_user,
                       postable: postable_types.sample.create!(content: 'My post.'),
                       created_at: random_past,
                       updated_at: random_past }
                   ])
end

p = Post.create!(author: User.find(1), postable: TextContent.create!(content: 'This is my post'))
p.comments.create!(author_id: 1, body: 'My comment')
p.comments.create!(author_id: 2, body: 'My comment2')

p = Post.create!(author: User.find(5), postable: TextContent.create!(content: 'This is my post'))
p.comments.create!(author_id: 1, body: 'My comment')
p.comments.create!(author_id: 2, body: 'My comment2')
# Nested comments
# u = User.last
# u.posts.create!(postable: TextContent.create!(content: 'My first post'))
# u.posts.find_by(postable_type: 'TextContent').comments.create!(author_id: 1, body: 'My first comment under a text post')
# textpost_comment_first_layer = Comment.last
# textpost_comment_first_layer.comments.create!(author_id: 1, body: 'A comment under a comment (text post)')
# textpost_comment_2nd_layer = Comment.last
# textpost_comment_2nd_layer.comments.create!(author_id: 1, body: 'This comment is 3 layers deep (text post)')
# textpost_comment_3rd_layer = Comment.last

# u.posts.create!(postable: PhotoContent.create!(content: 'My first post'))
# u.posts.find_by(postable_type: 'PhotoContent').comments.create!(author_id: 1, body: 'My first comment under a photo post')
# photopost_comment_first_layer = Comment.last
# photopost_comment_first_layer.comments.create!(author_id: 1, body: 'A comment under a comment (photo post)')
# photopost_comment_2nd_layer = Comment.last
# photopost_comment_2nd_layer.comments.create!(author_id: 1, body: 'This comment is 3 layers deep (photo post)')
# photopost_comment_3rd_layer = Comment.last
