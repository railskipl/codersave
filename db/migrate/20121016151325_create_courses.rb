class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
       t.string :course_title
       t.string :course_category
       t.string :headline
       t.text :course_summary
       t.text :goals_objectives
       t.string :intended_audience
       t.text :course_requirements
       t.string :instructor
       t.text  :description
       t.string :video_link
       t.integer :price
       t.integer :discounted_price
       t.string :Voucher
       t.date   :ExpiryDate
       t.integer :Number_of_People
       t.integer :courserating
       t.string  :affiliate_program_link
       t.timestamps
    end
  end
end
