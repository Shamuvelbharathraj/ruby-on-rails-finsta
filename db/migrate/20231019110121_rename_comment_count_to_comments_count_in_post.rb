class RenameCommentCountToCommentsCountInPost < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :comment_count, :comments_count
  end
end
