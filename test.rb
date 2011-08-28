require 'rubygems'
require './lib/dianxin'

@dianxin = Dianxin::Base.new('apid', 'key', 'productid')
puts @dianxin.inspect
@dianxin.sms('phone number', '你好')
