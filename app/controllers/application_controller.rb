class ApplicationController < ActionController::Base
  require 'uri'
  require 'net/http'
  require 'json'
  require 'httpclient'

  def youtubeSearch(keyword)
    default_query = 'Viscuit プログラミング'
    query = default_query + keyword

    # エンコードしたいデータをハッシュとして用意する
    # 以下のAPI公式サイト https://developers.google.com/youtube/v3/docs/search/list?hl=ja
    data = {
      part: "snippet",
      type: "video",
      maxResults: 10,
      order: "relevance",
      q: query,
      safeSearch: "strict",
      # videoEmbeddable: "true",
      key: ENV['YOUTUBE_API_KEY']
    }

    # URIエンコードを作成
    url_params = URI.encode_www_form(data)

    url = "https://www.googleapis.com/youtube/v3/search?#{url_params}"
    client    = HTTPClient.new

    uri = URI.parse(url)
    res = client.get(url) #レスポンシブを受け取る
    res = JSON.parse(res.body)    #レスポンシブをJSON形式にする
    videos = res['items']
    return videos
  end
end
