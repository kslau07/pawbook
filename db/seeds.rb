# TODO:
# Adding mock data using seeds.rb possibly not a best practice, look into
# creating a rake task
# https://www.reddit.com/r/rails/comments/143j24q/seeding_the_db_best_approach/

User.create!(email: 'test@example.com',
             password: 'password123',
             pets_name: 'Rufus')

u = User.find 1
u.posts.create!(postable: PhotoContent.create!(placeholder_content: 'a picture'))
u.posts.create!(postable: TextContent.create!(content: 'my first post'))
