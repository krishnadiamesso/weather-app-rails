class Api::V1::OpengeoController < ApplicationController
  def index
    uri_geo = URI("https://ipinfo.io?token=#{ENV["geo_token_api"]}")
    res_geo = Net::HTTP.get_response(uri_geo)
    output_geo = JSON.parse(res_geo.body)
    render json: output_geo
  end

  def useragent
    uri_geo = URI("https://api.ipregistry.co/user_agent?key=tpgv21vzj2hjhlru")
    res_geo = Net::HTTP.get_response(uri_geo)
    output_geo = JSON.parse(res_geo.body)
    render json: output_geo
  end


  def origin
    uri_geo = URI("https://api.ipregistry.co/?key=tpgv21vzj2hjhlru")
    res_geo = Net::HTTP.get_response(uri_geo)
    output_geo = JSON.parse(res_geo.body)
    render json: output_geo
  end
end
