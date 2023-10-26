# spec/models/comment_spec.rb

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_post_comments_counter' do
    it 'increments the associated post comments_counter' do
      # Arrange
      user = User.create(name: 'John')
      post = Post.create(title: 'Hello', author: user)
      comment = Comment.new(author: user, text: 'This is a comment')

      # Act
      comment.post = post
      comment.save

      # Reload the post from the database to get the latest data
      post.reload

      # Assert
      expect(post.comments_counter).to eq(1)
    end
  end
end
