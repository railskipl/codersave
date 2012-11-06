class Page < ActiveRecord::Base
  attr_accessible :title,:discription
  has_friendly_id :title, :use_slug => true


end
