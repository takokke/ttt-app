class SearchesController < ApplicationController
  def search_result
    @videos = youtubeSearch(params[:word])
  end
end
