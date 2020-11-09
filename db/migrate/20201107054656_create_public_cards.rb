class CreatePublicCards < ActiveRecord::Migration[5.2]
  def change
    create_table :public_cards do |t|
      t.string :index

      t.timestamps
    end
  end
end
