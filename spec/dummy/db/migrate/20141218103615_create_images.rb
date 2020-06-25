class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
