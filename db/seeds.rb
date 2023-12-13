# TODO:
# Adding mock data using seeds.rb possibly not a best practice, look into
# creating a rake task
# https://www.reddit.com/r/rails/comments/143j24q/seeding_the_db_best_approach/

1.times do |n|
  User.create!(email: "test_user@example.com",
               username: "test_user",
               password: 'password123')
end

4.times do |n|
  User.create!(email: Faker::Internet.email,
               username: "test_user#{n}",
               password: 'password123')
end

# u1 requests u2 (confirmed)
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(2),
                      confirmed: true)
# u1 requests u3
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(3),
                      confirmed: false)

# u4 requests u1 (confirmed)
FriendRequest.create!(sender: User.find(4),
                      recipient: User.find(1),
                      confirmed: true)
# u5 requests u1
FriendRequest.create!(sender: User.find(4),
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
