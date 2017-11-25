require 'bundler'
Bundler.require

class GithubApi
  attr_reader :login_id, :password, :repo, :client

  def initialize(login_id, password, repo)
    @login_id = login_id
    @password = password
    @repo = repo
    @client = Octokit::Client.new(login: @login_id, password: @password)
  end

  def issues
    # IssueだけでなくPull Requestも返すことがあるらしいので、Issueだけを返すようにしておく
    # https://developer.github.com/v3/issues/#list-issues-for-a-repository
    @client.issues(@repo).select{ |item| item[:pull_request].nil? }
  end

end
