class AddIsFeaturedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :is_featured, :boolean
  end
end
