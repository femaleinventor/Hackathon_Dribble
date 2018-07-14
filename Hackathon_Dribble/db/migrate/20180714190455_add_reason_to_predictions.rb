class AddReasonToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_column :predictions, :reason, :string
  end
end
