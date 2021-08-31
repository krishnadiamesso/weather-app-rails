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
    req = {
      "remote_ip": request.remote_ip,
      "x_forwarded_for": request.env["HTTP_X_FORWARDED_FOR"],
      "remote_addr": request.remote_addr,
      "remote_address": request.env['REMOTE_ADDR'],
    }
    render json: req
  end

  def origin
    uri_geo = URI("https://api.ipregistry.co/?key=tpgv21vzj2hjhlru")
    res_geo = Net::HTTP.get_response(uri_geo)
    output_geo = JSON.parse(res_geo.body)
    render json: output_geo
  end
end
