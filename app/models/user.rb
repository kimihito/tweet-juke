class User < ActiveRecord::Base
  validates :name, presence: true
  validates :image_url, presence: true
  has_many :musics
end