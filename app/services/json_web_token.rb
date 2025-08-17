class JsonWebToken
    SECRET_KEY = Rails.application.credentials.secret_key_base.to_s

    ALGORITHM = 'HS256' 

    def self.encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY, ALGORITHM)
    end

    def self.decode(token)
        decoded = JWT.decode(token, SECRET_KEY, true,{ algorithm: ALGORITHM })
        HashWithIndifferentAccess.new(decoded[0])
      rescue JWT::DecodeError => e
        Rails.logger.error "JWT Decode Error: #{e.message}"
        nil
    end
end