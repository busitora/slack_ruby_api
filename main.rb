require 'sinatra'
require 'json'
require 'dotenv'
require 'pry' if development?
require 'slack-ruby-client'
require './src/lgtm'
require './src/cat'

Dotenv.load

get '/' do
  'hello'
end

post '/webhook' do
  Slack.configure do |config|
    config.token = ENV['SLACK_API_TOKEN']
  end

  client = Slack::Web::Client.new
  channel_id = params['channel_id']
  command = params['command']

  # case文も共通化したいね
  case command
  when '/lgtm'
    lgtm = Lgtm.new
    client.chat_postMessage channel: channel_id, text: '(LGTM)' + lgtm.image
  when '/cat'
    neko = Cat.new
    client.chat_postMessage channel: channel_id, text: neko.image
  end
  return
end
