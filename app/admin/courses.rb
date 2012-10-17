ActiveAdmin.register Course do
  config.comments = false
   before_filter :only => :index do
     @per_page = 5
  end
end
  