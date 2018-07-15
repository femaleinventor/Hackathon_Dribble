class AddQuestionToPredictions < ActiveRecord::Migration[5.1]
  def change
    add_reference :predictions, :question
  end
end
