class AddMatchToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_reference :predictions, :match
  end
end
