# frozen_string_literal: true

# TODO: Create rake task for fake data, using seeds.rb possibly not best practice
# SOURCE: https://www.reddit.com/r/rails/comments/143j24q/seeding_the_db_best_approach/

post_bank = [
  'Meet my furry bundle of joy, always ready for a game of fetch! 🐾',
  'Just taught my dog a new trick, and the excitement in those wagging tails is everything! 🎾🐶',
  'Lazy Sunday with my four-legged bestie, who makes every moment better.',
  'Can we talk about how my dog gives the best cuddles ever? ❤️🐕',
  "Celebrating my dog's birthday today! Time flies, and I'm grateful for all the love and joy he brings into my life. 🎉🐾",
  'Took my dog to the park, and watching him make new friends is the highlight of my day! 🌳🐩',
  "My dog's loyalty is unmatched. Always there with a wagging tail, no matter what. 🐾❤️",
  'Successfully navigated the vet visit today! My dog is a trooper. 💪🐶',
  'Training update: my dog aced the recall command today. So proud! 🌟🐕',
  'Spent the day exploring new trails with my adventurous pup. The joy of discovery is mutual! 🏞️🐾',
  'Dealing with a major chewing phase. RIP to my favorite pair of shoes. 🐾👟',
  "Just discovered the 'artwork' my dog created with the trash. Cleanup mode activated. 🗑️🐕",
  'Ever had your dog decide the middle of the night is the perfect time for a barking spree? 😴🐶',
  'Note to self: never leave a sandwich unattended with a crafty dog around.',
  "Bath time turned into a wrestling match. I'm soaked, the bathroom is soaked, but the dog is proud. 🛁🐩",
  'Emergency vet visit today. Seems like my dog has a knack for finding trouble. 🚑🐾',
  'Is it just my dog, or do they all have a talent for finding mud puddles on the cleanest days? 🌧️🐕',
  'Fence-jumping escapade. Spent the morning chasing my dog around the neighborhood. 🏡🏃‍♂️',
  'The battle against shedding hair is real. Vacuuming twice a day and still losing. 🧹🐶',
  'Training setback: selective hearing strikes again. Sigh. 🙉🐾'
]

2.times do |n|
  n += 1
  User.create!(email: "test_user#{n}@example.com",
               username: "test_user#{n}",
               password: 'password123')
end

15.times do
  User.create!(email: Faker::Internet.email,
    username: Faker::Internet.username + rand(999).to_s,
               password: 'password123')
end

FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(2),
                      confirmed: true)
FriendRequest.create!(sender: User.find(3),
                      recipient: User.find(1),
                      confirmed: true)

# Unconfirmed requests
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(4),
                      confirmed: false)
FriendRequest.create!(sender: User.find(1),
                      recipient: User.find(7),
                      confirmed: false)
FriendRequest.create!(sender: User.find(5),
                      recipient: User.find(1),
                      confirmed: false)
FriendRequest.create!(sender: User.find(6),
                      recipient: User.find(1),
                      confirmed: false)

def random_time(type)
  if type == 'past'
    rand(0..1_000_000).minutes.ago
  elsif type == 'future'
    rand(0..1_000_000).minutes.from_now
  end
end

7.times do |_n|
  random_past = random_time('past')
  random_user = User.find(rand(1..User.count))
  postable_types = [TextContent]
  # postable_types = [TextContent, PhotoContent]
  Post.create!([
                 { author: random_user,
                   postable: postable_types.sample.create!(content: post_bank.sample),
                   created_at: random_past,
                   updated_at: random_past }
               ])
end

# p = Post.create!(author: User.find(1), postable: TextContent.create!(content: 'This is my post'))
# p.comments.create!(author_id: 1, body: 'My comment')
# p.comments.create!(author_id: 2, body: 'My comment2')

# p = Post.create!(author: User.find(5), postable: TextContent.create!(content: 'This is my post'))
# p.comments.create!(author_id: 1, body: 'My comment')
# p.comments.create!(author_id: 2, body: 'My comment2')
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
