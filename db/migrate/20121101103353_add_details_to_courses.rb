class AddDetailsToCourses < ActiveRecord::Migration
  def change
     add_column :courses, :out_of_stars,:integer
  end
end
