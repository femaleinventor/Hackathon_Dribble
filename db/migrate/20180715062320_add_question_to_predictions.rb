class AddQuestionToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_column :predictions, :references, :question
  end
end
