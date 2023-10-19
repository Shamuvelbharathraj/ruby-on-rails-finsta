class FillEveryCommentsCountColumnToPost < ActiveRecord::Migration[7.0]
  def up
    Post.find_each do |p|
      Post.reset_counters(p.id, :comments)
    end
  end
end
