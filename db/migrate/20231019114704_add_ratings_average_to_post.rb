class AddRatingsAverageToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :ratings_average, :float, default: 0.0 ,null: false
  end
end
