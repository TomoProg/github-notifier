require './github_api'
require './slack_api'
require 'bundler'
Bundler.require

github_api = GithubApi.new(ENV['GITHUB_LOGIN_ID'], ENV['GITHUB_PASSWORD'], ENV['GITHUB_REPO'])
slack_api = SlackApi.new(ENV['SLACK_API_TOKEN'])
header = "*Issueリスト*\n"
body = github_api.issues.map do |issue| 
  <<~BODY
  -----------------------------------------
  [No]    #{issue[:number]}
  [Title] #{issue[:title]}
  [URL]   #{issue[:html_url]}
  -----------------------------------------
  BODY
end

text = header + body.join

slack_api.send_message(ENV['SLACK_CHANNEL'], text)
