class AddPostedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :posted, :boolean, default: false
  end
end
