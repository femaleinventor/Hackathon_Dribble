class AddRefIdToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :ref_id, :bigint
  end
end
