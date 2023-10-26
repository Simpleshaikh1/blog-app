# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#recent_posts' do
    it 'returns the most recent posts for the user' do
      # Arrange
      user = User.create(name: 'John')
      post1 = Post.create(title: 'Post 1', author: user, created_at: 2.days.ago)
      post2 = Post.create(title: 'Post 2', author: user, created_at: 1.day.ago)
      post3 = Post.create(title: 'Post 3', author: user, created_at: Time.now)

      # Act
      recent_posts = user.recent_posts

      # Assert
      expect(recent_posts).to eq([post3, post2, post1])
    end
  end
end
