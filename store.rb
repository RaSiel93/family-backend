require 'sinatra'
require 'dragonfly'
require 'pry'

set :bind, '0.0.0.0'
set :port, '27016'
set :public_folder, 'dragonfly'

Dragonfly.app.configure do
  plugin :imagemagick

  url_format "/media/:job/:name"
  secret '482b70c797ac7149430eb49101a1ef629ef23c95a034c13218a14b0dc20dd400'
end

use Dragonfly::Middleware

get '/ping' do
  "pong #{Time.now}"
end

post '/write' do
  Dragonfly.app.store(params[:data], params[:meta])
end

get '/read' do
  Dragonfly.app.fetch(params[:uid])
end

post '/destroy' do
  Dragonfly.app.destroy(params[:uid])
end

get '/detect' do
  `python face_detector/detect_faces.py #{params[:url]}`
end
