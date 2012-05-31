class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :key
      t.binary :data

      t.timestamps
    end
    add_index :images, :key, :unique => true
  end
end
