# Copyright © 2017, Salesforce.com, Inc.
# All Rights Reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause

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

      def test_create_pull_request_is_successful
        client.expect(:create_pull_request, true, ['example/repository', 'example_base', 'example_head', 'example_title', 'example_body'])
        assert subject.create_pull_request(base: 'example_base', head: 'example_head', title: 'example_title', body: 'example_body').success?
      end
    end
  end
end
