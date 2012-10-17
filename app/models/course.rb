class Course < ActiveRecord::Base
   attr_accessible :course_title,:course_category,:headline,:course_summary,:goals_objectives,:intended_audience,:course_requirements,:instructor,:description,:video_link,:price, :discounted_price,:Voucher,:Number_of_People,:courserating,:ExpiryDate,:affiliate_program_link
end
