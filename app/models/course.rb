class Course < ActiveRecord::Base
 attr_accessible :course_title,:course_category,:headline,:course_summary,:goals_objectives,:intended_audience,:course_requirements,:instructor,:description,:video_link,:price, :discounted_price,:Voucher,:Number_of_People,:courserating,:ExpiryDate,:affiliate_program_link, :image, :remote_image_url,:profile_photo,:remote_profile_photo_url,:percent_off
   has_many :comments
    mount_uploader :image, ImageUploader
    mount_uploader :profile_photo, ProfilePhotoUploader
    
   ajaxful_rateable :dimensions => [:quality], :allow_update => true
end
