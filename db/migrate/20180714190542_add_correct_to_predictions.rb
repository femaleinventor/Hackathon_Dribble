class AddCorrectToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_column :predictions, :correct, :boolean
  end
end
