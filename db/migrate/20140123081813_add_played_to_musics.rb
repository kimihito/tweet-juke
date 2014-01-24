class AddPlayedToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :played, :boolean
  end
end
