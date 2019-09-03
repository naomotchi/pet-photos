class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string     :name
      t.text       :text
      t.text       :image
      t.timestamps null: true
    end
  end
end
