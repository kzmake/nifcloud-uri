require 'nifcloud/uri'

g = Nifcloud::Uri.generator(endpoint: 'https://west-1.cp.cloud.nifty.com/api/')

uri = g.Action('DescribeInstances')
p uri
