class AddArtsTable < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :imgfile, null: false
      t.timestamps null: false
      t.belongs_to :song, index: true
    end
  end
end
