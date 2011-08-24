require 'rubygems'
require './lib/dianxin'

@dianxin = Dianxin::Base.new('00001515', 'NzY4Mzk1MzcxMTIxMTg5ODg1NDc3NDU1', '100000000000000000075')
puts @dianxin.inspect
@dianxin.sms(18221944457, '你好')
