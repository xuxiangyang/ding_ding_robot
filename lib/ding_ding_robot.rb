require "ding_ding_robot/version"
require "ding_ding_robot/errors"
require "ding_ding_robot/message"
require 'uri'
require 'net/http'
require 'json'

class DingDingRobot
  attr_accessor :access_token, :max_retry
  def initialize(access_token)
    @access_token = access_token
    @max_retry = 3
  end

  def send_message(message)
    raise DingDingRobot::WrongMessageType.new("you need pass a DingDingRobot::Message") unless message.is_a?(DingDingRobot::Message)
    self.max_retry.times do |i|
      begin
        return _send_message(message)
      rescue Errno::ETIMEDOUT, Net::ReadTimeout, Timeout::Error, EOFError => e
        if i == self.max_retry - 1
          raise e
        end
      end
    end
  end

  def url
    "https://oapi.dingtalk.com/robot/send?access_token=#{self.access_token}"
  end

  private

  def _send_message(message)
    uri = URI(self.url)
    req = Net::HTTP::Post.new(uri, {'Content-Type' => 'application/json'})
    req.body = JSON.dump(message.as_json)
    http  = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = (uri.scheme == "https")
    resp = http.request(req)
    raise DingDingRobot::ErrorHttpResponse.new("http_code=#{resp.code} body=#{resp.body}") if resp.code_type != Net::HTTPOK
    result = JSON.parse(resp.body)
    raise DingDingRobot::SendMessageError.new(resp.body) if result["errcode"] != 0
    result
  end
end
