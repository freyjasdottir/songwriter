class AddSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :track_url, null: false
      t.string :embed_info
      t.timestamps null: false
      t.belongs_to :song, index: true
    end
  end
end
