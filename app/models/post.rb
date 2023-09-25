class Post < ApplicationRecord
  validates :name , :description, presence: true
  
  paginates_per 10
  has_many :comments, dependent: :destroy
  belongs_to :topic

  has_many :posts_tag, dependent: :destroy
  has_many :tags, through: :posts_tag
end
