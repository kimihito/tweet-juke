class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>[:create]

  def index
    #view側で見せ方は変更すること。
    @musics = Music.not_played.limit(10)
  end

  def create
    #Streamingで送られたデータを取得してくる
    data    = params["data"]
    name    = data["name"]
    img_url = data["image_url"]
    text    = data["text"]
    urls    = data["urls"]

    puts data

    user = User.where(name: name).first

    unless user
      user = User.create(name: name, image_url: img_url)
    end
    #URLからタイトルを取得する
    puts "add some musics"
    urls.each do |url|
      trim_query_url = trim_query(url)
      puts trim_query_url
      #TODO: まだじっそうしてまっせーん
      # title = get_title(url)
      title = url
      user.musics.create(url: trim_query_url, title: title, provider: get_provider(url))
    end
        Pusher.send {type:'ついかされたよ',hoge:{foo: musics.as_json}}, to: :all
    render nothing: true
  end

  def reload_data
    @new_musics = Music.not_played
    #追加されたデータを取得する
  end

  private

  def trim_query(url)
    parse_url = URI.parse(url)
    if parse_url.host == "www.youtube.com"
      "http://www.youtube.com/watch?v=wCnLeg04LEU"
      /v=(?<videoid>[^&]+)/ =~ parse_url.query
      url_removed_query = parse_url.scheme + "://" + parse_url.host + parse_url.path + videoid
    elsif parse_url.host == "soundcloud.com"
      url_removed_query = parse_url.scheme + "://" + parse_url.host + parse_url.path
    else
      return nil
    end
    url_removed_query
  end

  def get_provider(url)
    parse_url = URI.parse(url)
    if parse_url.host == "www.youtube.com"
      provider = 'youtube'
    elsif parse_url.host == "soundcloud.com"
      provider = 'soundcloud'
    else
      return nil
    end
    provider
  end

  def music_params
    params.require(:music).permit(:title, :url, :movieid)
  end

  def user_params
    params.require(:user).permit(:name, :image_url)
  end
end
