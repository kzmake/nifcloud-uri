require 'uri'
require 'active_support'
require 'active_support/core_ext'

module Nifcloud
  module Uri
    class Generator
      attr_accessor :secret_key, :access_key, :endpoint

      def initialize(options={})
        options = Nifcloud::Uri.options.merge(options)
        (Configuration::VALID_OPTIONS_KEYS + [:secret_key]).each do |key|
          send("#{key}=", options[key]) if options[key]
        end
      end

      def Action(action, options={})
        uri = URI(@endpoint)
        options.merge!({Action: action})
        set_query(options)
        uri.query = options.to_param
        uri.to_s
      end

      def inspect
        inspected = super

        if @secret_key
          inspected = inspected.sub! @secret_key, only_show_last_four_chars(@secret_key)
        end

        if @access_key
          inspected = inspected.sub! @access_key, only_show_last_four_chars(@access_key)
        end

        inspected
      end

      private

      def set_query(options={})
        set_timestamp(options)
        set_access_key(options)
        set_signature(options)
      end

      def set_timestamp(options={})
        options.merge!({Timestamp: Time.now.strftime("%Y%m%dT%H:%M:%SZ")})
      end

      def set_access_key(options={})
        raise Error::MissingCredentials.new("Please provide a access_key for user") unless @access_key
        options.merge!({AccessKeyId: @access_key})
      end

      def set_signature(options={})
        raise Error::MissingCredentials.new("Please provide a secret_key for user") unless @secret_key
        key = @secret_key
        data = "#{options[:Action]}#{options[:Timestamp]}"
        options.merge!({Signature: Signature.v0(key, data), SignatureVersion: '0'})
      end

      def only_show_last_four_chars(key)
        "#{'*'*(key.size - 4)}#{key[-4..-1]}"
      end
    end
  end
end
