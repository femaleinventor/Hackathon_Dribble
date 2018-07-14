class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbreviation
      t.string :nickname
      t.string :bright_color
      t.string :light_color
      t.string :dark_color
      t.string :twitter_list
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
