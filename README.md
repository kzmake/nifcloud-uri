# N i f c l o u d - U r i

ニフクラのIaaS APIのURIちょちょいっと作りたかったのでとりあえずつくってみたgem。

## いんすとーる

```
gem install nifcloud-uri
```
でぽんっ。

## つかいかた

こんなかんじで生成。
```ruby
require 'nifcloud/uri'

g = Nifcloud::Uri.generator(endpoint: 'https://west-1.cp.cloud.nifty.com/api/', secret_key: 'XXXXXX', access_key: 'YYYYYY')

uri = g.Action('DescribeInstances')
p uri
```

パラメタ(InstanceId=test)とかつけたい場合はこんなかんじ。自由につけれる。
```ruby
require 'nifcloud/uri'

Nifcloud::Uri.configure do |config|
  config.endpoint = 'https://west-1.cp.cloud.nifty.com/api/'
  config.secret_key = 'XXXXXXXXXXX'
  config.access_key = 'YYYYYYYYYYY'
end

uri = Nifcloud::Uri.Action('DescribeInstanceAttribute', InstanceId: 'test')
p uri
```

secret_keyとかaccess_keyは、環境変数として設定もできる。
```
$ export NIFCLOUD_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXX
$ export NIFCLOUD_SECRET_ACCESS_KEY=YYYYYYYYYYYYYYYYYYY
```

## その他
(自分のために作ったもの。放置するとおもう。)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kzmake/nifcloud-uri.
