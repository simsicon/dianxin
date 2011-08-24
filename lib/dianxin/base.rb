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
      params['params']['Num']             = number.to_s
      params['params']['Msg']             = message
      params['params']['IsReport']        = '0'
      params['params']['StatusReportUrl'] = 'http://114.80.110.16'
      params['params']['ProductID']       = @product_id
      params['params']['IsUse']           = '0'
      params['serviceId']                 = '00001020101130';
      params['params']['Parm1']           = "12"
      params['params']['Parm2']           = @product_id
      params['params']['Parm3']           = "56"
      
      response = RestClient.post "http://125.64.11.43:8080/udt-see/StartServiceServlet", encode_json(params), :content_type => :json, :accept => :json
      decoded_response = decode_json(response.to_s)
      puts decoded_response.inspect
    end

  private
  
    def encrypt(message, key)
      key = Base64.decode64(key)
      cipher = OpenSSL::Cipher::Cipher.new("des-ede3")
      cipher.encrypt
      cipher.key = key
      ciphertext = cipher.update(message) + cipher.final
      Base64.encode64(ciphertext).gsub(/\n/, '')
    end
    
    def encode_json(params)
      Yajl::Encoder.encode(params)
    end
    
    def decode_json(response)
      parser = Yajl::Parser.new
      hash = parser.parse(response)
      hash
    end
  end
end
