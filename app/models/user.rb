class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  attribute :name, :string
  attribute :bio, :text
  attribute :post_counter, :integer, default: 0
  attribute :photo, :string

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def three_most_recent_posts
    posts.includes(:author).order(created_at: :desc).limit(3)
  end
end
