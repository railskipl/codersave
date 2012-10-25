class AddPercentOffToCourses < ActiveRecord::Migration
  def change
     add_column :courses, :percent_off, :float
  end
end
