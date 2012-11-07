ActiveAdmin.register Page do
  
  form do |f|
    f.inputs do
      f.input :title
      f.input :discription, :input_html => {:class => "ckeditor"}
    
      end
      f.buttons
    end
    
   show do
    attributes_table do
    row :title  
    row :discription
     end 
  end
end
