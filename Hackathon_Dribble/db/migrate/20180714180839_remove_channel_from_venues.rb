class RemoveChannelFromVenues < ActiveRecord::Migration[5.1]
  def change
    remove_column :venues, :channel, :string
  end
end
