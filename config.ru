require 'dragonfly'
require 'openssl'
require 'pry'

Dragonfly.app.configure do
  # plugin :imagemagick


  # secret 'fawefawefaewf'

  url_format "/media/:job/:name"


  secret '482b70c797ac7149430eb49101a1ef629ef23c95a034c13218a14b0dc20dd400'
end

run Dragonfly.app


# binding.pry
# Dragonfly.app.fetch_url("www.publicdomainpictures.net/pictures/20000/velka/dragonfly-1317422772YLc.jpg").thumb('300x300').url
# route('')
# binding.pry
