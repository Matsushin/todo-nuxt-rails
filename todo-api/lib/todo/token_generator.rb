class TokenGenerator
  include Singleton

  SECRET = "c7b35e2bb685e56a5d10247190b1691b088fa584cd549746eda42a3beb054632"

  def initialize
    @generator = ActiveSupport::CachingKeyGenerator.new(ActiveSupport::KeyGenerator.new(SECRET))
    @digest = "SHA256"
  end

  def self.generate(klass, column)
    instance.generate(klass, column)
  end

  def generate(klass, column)
    key = key_for(column)

    loop do
      raw = SecureRandom.urlsafe_base64(15)
      enc = OpenSSL::HMAC.hexdigest(@digest, key, raw)
      break [raw, enc] unless klass.find_by(column => enc)
    end
  end

  def key_for(column)
    @generator.generate_key("TODO #{column}")
  end
end
