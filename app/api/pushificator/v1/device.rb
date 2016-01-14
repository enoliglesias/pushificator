module Pushificator
  class V1::Device < Grape::API
    use Rack::JSONP

    helpers do
      params :token do
        optional :token, type: String, default: nil,
        documentation: {
          type: 'String',
          desc: 'Authentication token'
        }
      end

      params :attributes do
        optional :attributes, type: Hash, default: {},
        documentation: {
          type: 'Hash',
          desc: 'Device params attributes'
        }
      end
    end

    resource :devices do

      desc 'REST Post with attributes param.' do
        detail <<-NOTE
        Creates a device with the information passed through attributes param.
        -----------------

        This is a hash, with the estruture:

        ```
        {"uiid": "JfFkLJf83fuUH3uhue3", "token", "qwerqwerfadsfasd", model": "Nexus 5", "manufacturer": "LG", "platform": "Android", "version": "6.0"}
        ```
        NOTE
      end
      params do
        use :token
        requires :attributes, type: Hash, desc: 'Device to be created' do
          requires :uuid, type: String, desc: 'device uuid'
          requires :model, type: String, desc: 'device model'
          requires :manufacturer, type: String, desc: 'device manufacturer'
          requires :platform, type: String, desc: 'device platform'
          requires :version, type: String, desc: 'device version'
          requires :token, type: String, desc: 'device registration token'
        end
      end
      post do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes])
          .permit(:uuid, :model, :manufacturer, :platform, :version)

          if safe_params
            device = ::Device.where(uuid: safe_params[:uuid]).first_or_initialize
            device.update_attributes(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
    end
  end
end
