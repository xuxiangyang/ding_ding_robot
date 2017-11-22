class DingDingRobot
  class Message
    class Markdown < DingDingRobot::Message
      def initialize(title, text)
        super(
              "markdown",
              {
               title: title,
               text: text,
              }
             )
      end
    end
  end
end
