class Like < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post

    # Methods
    after_save :update_post_likes_counter

    private

    def update_post_likes_counter
      post.increment!(:likes_counter)
    end
end
