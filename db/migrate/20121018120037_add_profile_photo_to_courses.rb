class AddProfilePhotoToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :profile_photo, :string
  end
end
