require 'octokit'
client = Octokit::Client.new(login: ENV['GITHUB_LOGIN_ID'], password: ENV['GITHUB_PASSWORD'])
