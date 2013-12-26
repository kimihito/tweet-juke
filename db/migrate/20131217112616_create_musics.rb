class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.belongs_to :user
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
