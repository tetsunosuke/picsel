class AddTagIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tag_id, :integer
  end
end
