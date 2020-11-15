class RemoveTagIdFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :tag_id, :integer
  end
end
