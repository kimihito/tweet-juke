class Music < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true
  belongs_to :user
  # before_cretate
  # TODO: new_record? でtitleを取得してくる

  def music_url
    url = URI.parse(self.url)
    if url.host == "youtube.com"
      /&/ =~ url.query
      videoid = $`
      url_removed_query = url.scheme+ "://" + url.host + url.path + videoid
      self.url = url_removed_query
    elsif url.host == "soundcloud.com"
      url_removed_query = url.scheme + "://" +url.host+url.path
      self.url = url_removed_query
    else
      return false
    end
  end
end