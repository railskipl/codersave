class Comment < ActiveRecord::Base
  attr_accessible :body, :course_id, :user_id
  
  belongs_to :course
end
