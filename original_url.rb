# frozen_string_literal: true

class OriginalUrl < ApplicationService
    require "net/https"
    require "uri"

    attr_accessor :short_url

    def initialize(short_url)
        @short_url = short_url
    end

    def perform
        original_url(short_url)
    end

    def original_url(short_url)
        uri = URI.parse(short_url)
        response = Net::HTTP.get_response(uri)

        while response.is_a? (Net::HTTPRedirection)
            uri = URI.parse(response["location"])
            response =  Net::HTTP.get_response(uri)
        end

        uri.to_s
    end
end
