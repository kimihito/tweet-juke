class Music < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  belongs_to :user
  # TODO: new_record? でtitleを取得してくる

  def self.youtube?
    self.provider == "youtube"
  end

  def self.soundcloud?
    self.provider == "soundcloud"
  end

  def self.not_played
    self.where(played: false)
  end

  def self.trim_query
    
  end
end