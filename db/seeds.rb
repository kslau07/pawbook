# TODO:
# Adding mock data using seeds.rb possibly not a best practice, look into
# creating a rake task
# https://www.reddit.com/r/rails/comments/143j24q/seeding_the_db_best_approach/

User.create!(email: 'test@example.com',
             password: 'password123',
             pets_name: 'Rufus')

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
