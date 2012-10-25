class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body
      t.integer :course_id
    
      t.timestamps
    end
      add_foreign_key :comments, :courses 
  end
end
