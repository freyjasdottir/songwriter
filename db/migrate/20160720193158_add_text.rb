class AddText < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :body, null: false
      t.timestamps null: false
      t.belongs_to :song, index: true
    end
  end
end
