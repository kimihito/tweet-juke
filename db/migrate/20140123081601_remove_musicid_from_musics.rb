class RemoveMusicidFromMusics < ActiveRecord::Migration
  def change
    remove_column :musics, :musicid, :string
  end
end
