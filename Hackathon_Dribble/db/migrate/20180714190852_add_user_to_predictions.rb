class AddUserToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_reference :predictions, :user, foreign_key: true
  end
end