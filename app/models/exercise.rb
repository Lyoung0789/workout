class Exercise < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true 
    validates :date, presence: true
    validates :reps, presence:true  

end 