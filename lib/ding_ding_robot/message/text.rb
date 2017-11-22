class DingDingRobot
  class Message
    class Text < DingDingRobot::Message
      def initialize(content)
        super(
              "text",
              {
               content: content,
              }
             )
      end
    end
  end
end
