class IdeasController < ApplicationController
  def index
   @videos = youtubeSearch("")
  end

  def show

  end

end
