require 'bundler'
Bundler.require

class SlackApi
  attr_reader :client

  def initialize(token)
    Slack.configure do |config|
      config.token = token
    end
    @client = Slack::Web::Client.new
  end

  def auth_test
    @client.auth_test
  end

  def send_message(channel, text)
    @client.chat_postMessage(channel: channel, text: text, as_user: true)
  end

end
