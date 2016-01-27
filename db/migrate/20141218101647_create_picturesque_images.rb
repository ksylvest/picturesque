class CreatePicturesqueImages < ActiveRecord::Migration
  def change
    create_table :picturesque_images do |t|

      t.timestamps null: false
    end
  end
end
