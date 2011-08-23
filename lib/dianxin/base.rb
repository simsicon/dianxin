module Dianxin
  class Base

    def initialize(apid, key, product_id)
      @apid = apid
      @key = key
      @product_id = product_id
    end
    
    def sms(number, message)
      timestamp                           = Time.now.strftime('%Y%m%d%H%M%S')
      
      params                              = {}
      params['params']                    = {}
      params['params']['TimeStamp']       = timestamp
      params['params']['APID']            = @apid
      params['params']['Key']             = encrypt(timestamp+@apid, @key);
      params['params']['Num']             = number
      params['params']['Msg']             = message
      params['params']['IsReport']        = '0'
      params['params']['StatusReportUrl'] = 'http://114.80.110.16'
      params['params']['ProductID']       = @product_id
      params['params']['IsUse']           = '0'
      params['serviceId']                 = '00001020101130';
      params['params']['Parm1']           = "12"
      params['params']['Parm2']           = @product_id
      params['params']['Parm3']           = "56"
      
      puts params.inspect
      
      #do something with the message.
    end

  private
  
    def encrypt(message, key)
      key = Base64.decode64(key)
      puts key
      cipher = OpenSSL::Cipher::Cipher.new("des-ede3")
      cipher.encrypt # Call this before setting key or iv
      cipher.key = @key
      # cipher.iv = '01234'
      ciphertext = cipher.update(message)
      ciphertext << cipher.final
      encodedCipherText = Base64.encode64(ciphertext)

      puts "ENCODED: " + encodedCipherText
      encodedCipherText
    end
  
    def perform_post(path, options={})
    end
  end
end
