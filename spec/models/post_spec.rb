# spec/models/post_spec.rb

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#update_user_posts_counter' do
    it 'increments the associated author posts_counter' do
      # Arrange
      user = User.create(name: 'John')
      post = Post.new(title: 'Hello', author: user)

      # Act
      post.save

      # Reload the user from the database to get the latest data
      user.reload

      # Assert
      expect(user.posts_counter).to eq(1)
    end
  end
end
