require_relative '../../test_helper'
require 'flo/provider/github_flo'
require 'ostruct'
# require 'octokit'

module Flo
  module Provider
    class GithubFloTest < ::GithubFlo::UnitTest

      def subject
        @subject ||= Flo::Provider::GithubFlo.new(repo: 'example/repository', client: client)
      end

      def parameters
        @number ||= "1234"
        @repo ||= 'example/repository'
        @parameters ||= [@repo, @number]
      end

      def client
        @client ||= Minitest::Mock.new
      end

      def test_update_issue_is_successful
        client.expect(:update_issue, OpenStruct.new(assignee: OpenStruct.new(login: 'new_user')), parameters + [{assignee: 'new_user'}])
        assert subject.update_issue(number: '1234', assignee: 'new_user').success?
      end

      def test_add_labels_to_an_issue_is_successful
        client.expect(:add_labels_to_an_issue, [OpenStruct.new(name: 'new label')], parameters + [['new label']])
        assert subject.add_labels_to_an_issue(number: '1234', labels: ['new label']).success?
      end
    end
  end
end
