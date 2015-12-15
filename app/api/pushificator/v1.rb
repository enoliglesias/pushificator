module Pushificator
  class V1 < Grape::API
    version 'v1', using: :path, vendor: 'pushificator'
    # Specific content type to set UTF-8 and avoid codification problems
    content_type :json, 'application/json; charset=UTF-8'
    prefix :api
    format :json

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    helpers do
      def api_response response
       case response
       when Integer
         status response
       when String
         response
       when Hash
         response
       when Net::HTTPResponse
         "#{response.code}: #{response.message}"
       else
         status 400 # Bad request
       end
      end

      def authenticate!
       error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      end

      def clean_params(params)
       ActionController::Parameters.new(params)
      end

    end

    mount Device
  end
end
