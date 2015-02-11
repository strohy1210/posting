class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :image_url
      t.string :address

      t.timestamps
    end
  end
end
