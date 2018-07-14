class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :display_text
      t.string :response_type

      t.timestamps
    end
  end
end
