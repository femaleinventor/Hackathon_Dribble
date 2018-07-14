class Match < ApplicationRecord
  belongs_to :league
  belongs_to :away_team
  belongs_to :home_team
  belongs_to :sport
  belongs_to :venue
end
