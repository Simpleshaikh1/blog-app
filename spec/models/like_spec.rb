# spec/models/like_spec.rb

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_post_likes_counter' do
    it 'increments the associated post likes_counter' do
      # Arrange
      user = User.create(name: 'John')
      post = Post.create(title: 'Hello', author: user)
      like = Like.new(author: user)

      # Act
      like.post = post
      like.save

      # Reload the post from the database to get the latest data
      post.reload

      # Assert
      expect(post.likes_counter).to eq(1)
    end
  end
end
