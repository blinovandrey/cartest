class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :car_id

      t.timestamps
    end
  end
end
