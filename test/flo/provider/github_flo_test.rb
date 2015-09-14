require 'test_helper'

module Flo
  module Provider
    class GithubFloTest < GithubFlo::UnitTest

      def subject
        @subject ||= Flo::Provider::GithubFlo.new
      end

      def test_set_issue_assignee_sets_assignee_on_issue
        skip "Not yet implemented"
      end
    end
  end
end
