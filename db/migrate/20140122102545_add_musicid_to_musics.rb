class AddMusicidToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :musicid, :string
  end
end
