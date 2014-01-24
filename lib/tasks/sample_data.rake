namespace :db do
  desc 'Fill database with sample data'
  task add_data: :environment do
    make_musics
  end
end

def make_users
  User.create(name: 'kimihito_', image_url: 'https://pbs.twimg.com/profile_images/426273251476926464/rAc5cOcZ.jpeg' )
end

def make_musics
  require 'uri'
  require 'net/http'
  require 'json'

  puts 'post data'
  puts 'url parsed.'
  urls = ['http://www.youtube.com/watch?v=webZ80CGezY', 'http://www.youtube.com/watch?v=wCnLeg04LEU','http://www.youtube.com/watch?v=WXUEeecBcsU','http://www.youtube.com/watch?v=75fXFouP8mo' ]


  data = {
          data:
            {
              name: 'kimihito_',
              image_url: 'https://pbs.twimg.com/profile_images/426273251476926464/rAc5cOcZ.jpeg',
              text: 'hoge',
              urls: urls
            }
          }

  uri = URI.parse('http://0.0.0.0:3000/create')
  post uri, data
end


def post url, hash
  req = Net::HTTP::Post.new url
  req.body = hash.to_json
  req.content_type = 'application/json'
  Net::HTTP::start(url.hostname, url.port) {|http|http.request(req)}
end

