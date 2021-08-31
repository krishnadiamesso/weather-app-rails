# frozen_string_literal: true

module Api
  module V1
    class OpenweatherController < ApplicationController
      def index
        ip = request.remote_ip
        ip = '161.185.160.93' if ip.nil? || (ip == '127.0.0.1')
        uri_geo = URI("https://ipinfo.io/#{ip}?token=#{ENV['geo_token_api']}")
        puts uri_geo
        res_geo = Net::HTTP.get_response(uri_geo)
        output_geo = JSON.parse(res_geo.body)
        coordinates = output_geo['loc'].split(',')
        latitude = coordinates[0]
        longitude = coordinates[1]

        uri_open_weather = URI("https://api.openweathermap.org/data/2.5/weather?lat=#{latitude}&lon=#{longitude}&units=metric&appid=#{ENV['open_weather_api']}")
        res_open_weather = Net::HTTP.get_response(uri_open_weather)
        output_open_weather = JSON.parse(res_open_weather.body)
        render json: output_open_weather
      end
    end
  end
end
