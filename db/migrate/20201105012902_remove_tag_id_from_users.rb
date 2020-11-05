class RemoveTagIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :tag_id, :integer
  end
end
