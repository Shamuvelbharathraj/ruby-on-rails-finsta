class Post < ApplicationRecord
  scope :filtered, ->(from,to) {where("created_at between ? and ?",from,to.to_date + 1.day)}

  validates :name, length: {maximum: 20}
  validates :name , :description, presence: true

  has_one_attached :post_profile 
  
  paginates_per 10
  has_many :comments, dependent: :destroy
  belongs_to :topic

  has_many :posts_tag, dependent: :destroy
  has_many :tags, through: :posts_tag

  has_many :ratings, dependent: :destroy

  belongs_to :user

  has_and_belongs_to_many :users

  
end
