class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true
  
  attr_accessible :rater_id, :dimension,:stars,:dimension,:rateable_type
end
