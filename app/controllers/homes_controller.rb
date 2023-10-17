class HomesController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'json'
  require 'httpclient'
  def top


    default_query = "viscuit プログラミング"
    input = "マイクラ"
    query = default_query + input
    api_key = 'AIzaSyCjkpfk6EW2gwDNtE7CXK-3uzhAOQmKc2k'


    # エンコードしたいデータをハッシュとして用意する
    data = {
      part: "snippet",
      type: "video",
      maxResults: 10,
      order: "date",
      q: query,
      safeSearch: "strict",
      videoEmbeddable: "true",
      key: api_key
    }

    # URIエンコードを作成
    url_params = URI.encode_www_form(data)

    url = "https://www.googleapis.com/youtube/v3/search?#{url_params}"
    client    = HTTPClient.new

    uri = URI.parse(url)
    res = client.get(url) #レスポンシブを受け取る
    res = JSON.parse(res.body)    #レスポンシブをJSON形式にする
    @videos = res['items']

  end
end
