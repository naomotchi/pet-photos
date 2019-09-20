class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.integer :album_id
      t.integer :photo_id
      t.timestamps
    end
  end
end
