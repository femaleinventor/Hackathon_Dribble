class RemoveCorrectFromPredictions < ActiveRecord::Migration[5.1]
  def change
    remove_column :predictions, :correct, :string
  end
end
