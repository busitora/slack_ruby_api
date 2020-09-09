# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'dotenv'
require 'pry'
require 'slack-ruby-client'

Dotenv.load

get '/' do
  'hello'
end

post '/webhook' do
  Slack.configure do |config|
    config.token = ENV['SLACK_API_TOKEN']
  end

  # APIクライアントを生成
  client = Slack::Web::Client.new
  # client = Slack::RealTime::Client.new

  # #チャンネル名 of @ユーザー名
  channel = '#x-nandemo-memo'

  url = 'https://www.lgtm.app/api/images/random'
  res = Faraday.get(url)
  res_body = JSON.parse(res.body)

  response = client.chat_postMessage(channel: channel, text: res_body['imageURL'])
  p response
end
