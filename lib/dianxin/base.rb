module Dianxin
  class Base

    def initialize(apid, key, product_id)
      @apid = apid
      @key = key
      @product_id = product_id
    end
    
    def sms(message)
      encrypt(Time.now.strftime('%Y%m%d%H%M%S')+@apid, @key)
      #do something with the message.
    end

  private
  
    def encrypt(message, key)
      key = Base64.decode64(key)
      puts key
      cipher = OpenSSL::Cipher::Cipher.new("des3")
      cipher.encrypt # Call this before setting key or iv
      cipher.key = @key
      # cipher.iv = '01234'
      ciphertext = cipher.update(message)
      ciphertext << cipher.final
      encodedCipherText = Base64.encode64(ciphertext)

      puts encodedCipherText
      encodedCipherText
    end
  
    def perform_post(path, options={})
      options[:query] = {} unless options[:query]
      options[:query][:source] = Weibo::Config.api_key
      Weibo::Request.post(self, path, options)
    end
  end
end
