class CreateCommentsratings < ActiveRecord::Migration[7.0]
  def change
    create_table :commentsratings do |t|
      t.integer :no
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
