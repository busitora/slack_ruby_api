# frozen_string_literal: true

# require 'sinatra'
require 'dotenv'
require 'pry'
require 'slack-ruby-client'

Dotenv.load

# get '/' do
#   'hello'
# end

# post '/webhook' do
#   binding.pry
#   'hello'
# end

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

# APIクライアントを生成
client = Slack::Web::Client.new
# client = Slack::RealTime::Client.new

# #チャンネル名 of @ユーザー名
channel = '#x-nandemo-memo'

# メッセージ
text = 'こんにちは'

response = client.chat_postMessage(channel: channel, text: text, as_user: true)
client.chat_postMessage(channel: channel, text: '-------')

p response
