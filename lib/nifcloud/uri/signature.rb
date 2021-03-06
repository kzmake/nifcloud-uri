require 'openssl'
require 'base64'
require 'cgi/util'

module Nifcloud
  module Uri
    class Signature
      def self.v0(key, data)
        Base64.encode64(OpenSSL::HMAC.digest("sha1", key.encode("utf-8"), data.encode("utf-8"))).chomp
      end

      def self.v2(key, data)
        Base64.encode64(OpenSSL::HMAC.digest("sha256", key.encode("utf-8"), data.encode("utf-8"))).chomp
      end
    end
  end
end
