module Pushificator
  class V1 < Grape::API
    version 'v1', using: :path, vendor: 'pushificator'
    # Specific content type to set UTF-8 and avoid codification problems
    content_type :json, 'application/json; charset=UTF-8'
    prefix :api
    format :json
  end
end
