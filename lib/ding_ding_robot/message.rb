require_relative './message/text'
require_relative './message/link'
require_relative './message/markdown'
class DingDingRobot
  class Message
    attr_accessor :message_type, :payload, :is_at_all, :at_mobiles

    def initialize(message_type, payload)
      @message_type = message_type
      @payload = payload
      @is_at_all = false
      @at_mobiles = []
    end

    def as_json
      json = {
              msgtype: self.message_type,
              at: {
                   atMobiles: self.at_mobiles,
                   isAtAll: self.is_at_all,
                  },
             }
      json[self.message_type.to_sym] = payload
      json
    end
  end
end
