class Question < ApplicationRecord
  belongs_to: :match, optional: true 
end
