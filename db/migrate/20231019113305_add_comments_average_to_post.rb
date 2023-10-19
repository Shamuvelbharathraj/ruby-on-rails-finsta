class AddCommentsAverageToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comments_average, :integer
  end
end
