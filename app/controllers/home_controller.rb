class HomeController < ApplicationController
  def index
  end
  def create
    #Streamingで送られたデータを取得してくる
    name    = params[:data].name
    img_url = params[:data].image_url
    text    = params[:data].text
    urls     = params[:data].urls
    #Youtube, SoundCloudのURLを判断してデータを登録する
    #つぶやきと動画のURLを分ける

  end
  def reload_data
    #追加されたデータを取得する
  end
end