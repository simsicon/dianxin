module Dianxin
  class Base

    def initialize(apid, key, product_id)
      @apid = apid
      @key = key
      @product_id = product_id
    end
    
    def sms(message)
      encrypt('2011082221303200001515', @key)
    end

  private
  
    def string_to_hex
      
    end
  
    def encrypt(message, key)
      key = Base64.decode64(key)
      puts key
      cipher = OpenSSL::Cipher::Cipher.new("des-ede3-cbc")
      cipher.encrypt # Call this before setting key or iv
      cipher.key = @key
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
