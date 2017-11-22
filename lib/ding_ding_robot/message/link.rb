class DingDingRobot
  class Message
    class Link < DingDingRobot::Message
      def initialize(title, text, message_url, pic_url = nil)
        super(
              "link",
              {
               title: title,
               text: text,
               messageUrl: message_url,
               picUrl: pic_url,
              }
             )
      end
    end
  end
end
