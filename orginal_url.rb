# frozen_string_literal: true

require 'net/https'
require 'uri'

class ShortenUrl
    def original_url(original_url)
        uri = URI.parse(short_url)
        response = Net::HTTP.get_response(uri)

        while response.is_a? (Net::HTTPRedirection)
            uri = URI.parse(response['location'])
            response =  Net::HTTP.get_response(uri)
        end

        uri.to_s
    end
end

short = OriginalUrl.new

puts short.shortend_url("https://shorturl.at/QaKex")