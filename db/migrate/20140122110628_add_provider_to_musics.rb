class AddProviderToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :provider, :string
  end
end
