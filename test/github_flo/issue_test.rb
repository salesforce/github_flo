require_relative '../test_helper'
require 'github_flo/issue'

module GithubFlo
  class IssueTest < GithubFlo::UnitTest

    def subject
      @issue_id ||= "221"
      @repo || 'assistly/desk-flow-test'
      @subject ||= GithubFlo::Issue.new(@repo, @issue_id)
    end

    def test_assignee_returns_assignee_name
      assert_equal "dangerp", subject.assignee
    end
  end
end
