class AddLikesToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_column :predictions, :likes, :integer
  end
end
