class AddSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, null: false, default: 'Untitled'
      t.string :body
      t.belongs_to :user, index: true
    end
  end
end
