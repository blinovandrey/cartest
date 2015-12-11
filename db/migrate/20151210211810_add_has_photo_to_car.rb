class AddHasPhotoToCar < ActiveRecord::Migration
  def change
    add_column :cars, :has_photo, :boolean
  end
end
