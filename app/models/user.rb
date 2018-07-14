class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



 private
 def calculate_percent_correct_predictions
   correct_predictions = self.predictions.where(correct?: true).count
   total_predictions = self.predictions.count

   percent_correct = (correct_predictions.to_f / total_predictions.to_f) * 100

   percent_correct.to_i
 end

end
