require 'octokit'

module GithubFlo
  class Issue

    attr_accessor :repo_name, :issue_id

    def initialize(repo_name, issue_id)
      @repo_name = repo_name
      @issue_id = issue_id
    end

    def assignee
      issue_object.assignee
    end

    private

    def issue_object
      ::Octokit.issue(repo_name, issue_id)
    end

  end
end
