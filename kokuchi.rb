# -*- coding: utf-8 -*-
require 'pry'
require 'twitter'
require 'dotenv'
Dotenv.load

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_OAUTH_TOKEN']
  config.access_token_secret = ENV['TWITTER_OAUTH_TOKEN_SECRET']
end

def randn
  Math.sqrt(-2 * Math.log(rand)) * Math.cos(2 * Math::PI * rand)
end

def message
  titles = ['如法会 1', '第3回Cocoa勉強会広島', 'Hiroshima.Swift',
            'Docker Meetup Hiroshima', 'Learning Machine Learning (機械学習学習会)',
            'hiλoshima (広島関数型プログラミング勉強会)']
  url = 'https://nyoho.doorkeeper.jp/events/44444'
  date = '5月22日(日) 13:30から'
  place = '広島大学 東千田キャンパス'
  tag = '#如法会'
  sanka = ['お気楽に参加登録を!→', '参加はこちら→', '参加登録ドゾー', 'お気楽に→', 'このぞろ目イベントに是非参加ポチッ→']
  kaisai = ['が開催されます!', 'いよいよ開催!', '開催です!']
  %(#{titles.sample} #{kaisai.sample} #{date} #{place}にて! #{sanka.sample}#{url} #{tag})
end

mean = 4 * 60 * 60
sigma = 1 * 60 * 60

loop do
  client.update message
  sec = randn * sigma + mean
  sec = 0 if sec < 0
  print "Sleep #{sec} sec...\r"
  sleep sec
end
