class AddStartEndDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :duration, :text
    add_column :events, :zipcode, :text
    add_column :events, :street, :text
    add_column :events, :city, :text
  end
end
