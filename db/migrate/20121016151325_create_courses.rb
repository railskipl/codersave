class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
       t.string :course_title
       t.string :course_category
       t.string :headline
       t.string :course_summary
       t.string :goals_objectives
       t.string :intended_audience
       t.string :course_requirements
       t.string :instructor
       t.string :description
       t.string :video_link
       t.float  :price
       t.float  :discounted_price
       t.string :Voucher
       t.date   :ExpiryDate
       t.integer :Number_of_People
       t.integer :courserating
       t.string  :affiliate_program_link
       t.timestamps
    end
  end
end
