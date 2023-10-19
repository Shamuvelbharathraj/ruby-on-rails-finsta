class Rating < ApplicationRecord
  belongs_to :post

  after_create :update_average_to_post

  def update_average_to_post
    post=Post.find(post_id)
    post.update(ratings_average: post.ratings.average(:no).to_f.truncate(1))
    puts "ok"
  end
end
