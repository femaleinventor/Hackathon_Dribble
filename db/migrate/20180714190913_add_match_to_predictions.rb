class AddMatchToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_reference :predictions, :match, foreign_key: true
  end
end
