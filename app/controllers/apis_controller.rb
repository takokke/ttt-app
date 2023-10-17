class ApisController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'json'
  require 'httpclient'

  def show

    default_query = "Viscuit 作り方 "
    input = "野球"
    query = default_query + input
    api_key = ENV['Y_API_KEY']

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
