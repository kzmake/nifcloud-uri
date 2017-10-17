require 'nifcloud/uri'

g = Nifcloud::Uri.generator(endpoint: 'https://computing.jp-west-1.api.cloud.nifty.com/api/')

uri = g.Action('DescribeInstances')
p uri
