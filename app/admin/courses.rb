ActiveAdmin.register Course do
  config.comments = false
  
  before_filter :only => :index do
     @per_page = 5
  end
  
  
     category = [["Webtutorial"], ["Apptutorial"]]
     
   form do |f|
    f.inputs do
      f.input :course_title
      f.input :course_category, :as => :select, :collection => category,:prompt=>'select'
      f.input :is_featured
      f.input :headline
      f.input :course_summary,:input_html => {:class => "ckeditor"}
      f.input :goals_objectives,:input_html => {:class => "ckeditor"}
      f.input :intended_audience
      f.input :course_requirements,:input_html => {:class => "ckeditor"}
      f.input :instructor
      f.input :description,:input_html => {:class => "ckeditor"}
      f.input :video_link
      f.input :price
      f.input :discounted_price
      f.input :percent_off
      f.input :Voucher
      f.input :Number_of_People
      f.input :courserating
      f.input :out_of_stars
      f.input :ExpiryDate
      f.input :affiliate_program_link
      f.input :image
      f.input :profile_photo
      
    end
    f.buttons
  end 
  
   index do
    column :id
    column :course_title
    column :course_category
    column :instructor
    column :price
    column :discounted_price
    column :percent_off
    column :courserating
    column :is_featured
    default_actions
  end
       
    
  show do
    attributes_table do
    row :course_title
    row :course_category
    row :headline
    row :course_summary
    row :goals_objectives
    row :intended_audience
    row :course_requirements
    row :instructor
    row :description
    row :video_link
    row :price
    row :discounted_price
    row :percent_off
    row :Voucher
    row :Number_of_People
    row :courserating
    row :ExpiryDate
    row :affiliate_program_link
    row :image
    row :is_featured
    row :out_of_stars
     
  end
  end
 
  
end
