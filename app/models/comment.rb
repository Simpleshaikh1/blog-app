class Comment < ApplicationRecord
  # Attributes
  attribute :text, :text

  # Associations
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # Methods
  after_save :update_post_comments_counter

  private

  def update_post_comments_counter
    post.increement!(:comments_counter)
  end
  
  # Validations
  validates :text, presence: true
end
