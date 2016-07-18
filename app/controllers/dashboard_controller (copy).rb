# ---------- search results module ----------
module SearchAPI
  require 'httparty'
  require 'json'

  url = "https://pixabay.com/api/?key="
  # key = Module.key DO THIS <----------
  key = "2892207-d5872058f9450c1cea591ba03"
  high_res = "&response_group=high_resolution"
  query_search = params[:search_bar].gsub(" ", "+") # ***************************************
  # query = "&q=yellow+flowers&image_type=photo&per_page=200"
  query = "&q=#{query_search}&image_type=photo&per_page=200"

  # response = HTTParty.get(url + key + high_res + query) #requires permission from pixabay
  response = HTTParty.get(url + key + query)
  body = JSON.parse(response.body)

  @hits = body["hits"]

  # puts list of search result urls
  def self.results
    images = []
    i = 0
    while i < @hits.length do
      url = @hits[i]["webformatURL"].gsub("_640.jpg", "_960.jpg")
      images << url
      i += 1
    end
    images
  end
  # search_results = results(hits)
  # p search_results
  # # p body["totalHits"]
end

# ---------- search results Module end ----------
class DashboardController < ApplicationController

include SearchAPI

  def search # get
  end

  def search_handler #post
    search_results = SearchAPI.results
    @@search_results = search_results
    redirect_to show_results_path

  end

  def show_results
    @search_results = @@search_results
  end
end
