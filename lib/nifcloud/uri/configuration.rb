module Nifcloud
  module Uri
    module Configuration
      VALID_OPTIONS_KEYS = [:endpoint, :secret_key, :access_key].freeze

      attr_accessor(*VALID_OPTIONS_KEYS)

      def self.extended(base)
        base.reset
      end

      def configure
        yield self
      end

      def options
        VALID_OPTIONS_KEYS.inject({}) do |option, key|
          option.merge!(key => send(key))
        end
      end

      def reset
        self.endpoint = ENV['NIFCLOUD_API_ENDPOINT']
        self.secret_key = ENV['NIFCLOUD_API_SECRET_KEY']
        self.access_key = ENV['NIFCLOUD_API_ACCESS_KEY']
      end
    end
  end
end
