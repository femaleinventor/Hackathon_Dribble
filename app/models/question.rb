class Question < ApplicationRecord
  belongs_to :match, optional: true
  belongs_to :prediction, optional: true
end
