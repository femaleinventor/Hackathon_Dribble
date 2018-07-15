class AddRefIdToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :ref_id, :bigint
  end
end
