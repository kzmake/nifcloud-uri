require 'nifcloud/uri/version'
require 'nifcloud/uri/signature'
require 'nifcloud/uri/configuration'
require 'nifcloud/uri/generator'

module Nifcloud
  module Uri
    extend Configuration

    def self.generator(options={})
      Nifcloud::Uri::Generator.new(options)
    end

    def self.method_missing(method, *args, &block)
      return super unless generator.respond_to?(method)
      generator.send(method, *args, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      generator.respond_to?(method_name) || super
    end
  end
end

