# Copyright © 2017, Salesforce.com, Inc.
# All Rights Reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause

require 'octokit'

module Flo
  module Provider
    class GithubFlo

      # Creates a new GithubFlo Provider instance
      #
      # @param [Hash] opts The options needed to create the provider
      # @option opts [String] :user The username of the github user
      # @option opts [String] :token an access token for the user
      # @option opts [String] :repo the name of the repo, e.g. 'salesforce/github_flo'
      #
      def initialize(opts={})
        username = opts[:user]
        token = opts[:token]
        @repo = opts[:repo]

        @client = opts[:client] || Octokit::Client.new(login: username, password: token)
      end

      # Updates a Github issue
      #
      # @param [Hash] opts Options for updating an issue
      # @option opts [String] :number The issue number to update
      #
      # Remaining options will be passed to octokit.  See octokit's documentation for updating issues
      #
      def update_issue(opts={})
        options = {repo: @repo}.merge(opts)
        @client.update_issue(options.delete(:repo), options.delete(:number), options)
        OpenStruct.new(success?: true)
      end

      # Adds labels to a Github Issue
      #
      # @param [Hash] opts Options for updating an issue
      # @option opts [String] :number The issue number to update
      # @option opts [Array<String>] :labels A list of labels to add to the issue
      #
      # Remaining options will be passed to octokit.  See octokit's documentation for updating issues
      #
      def add_labels_to_an_issue(opts={})
        options = {repo: @repo}.merge(opts)
        @client.add_labels_to_an_issue(options.delete(:repo), options.delete(:number), options[:labels])
        OpenStruct.new(success?: true)
      end

      # Provides an Octokit issue.  This is helpful when you want to take some other action based on
      # the state of an issue.
      #
      # @param [Hash] opts Options for finding the issue
      # @option opts [String] :number The issue number to fetch
      #
      # @return [Sawyer::Resource] The issue returned from octokit
      #
      def issue(opts={})
        options = {repo: @repo}.merge(opts)
        @client.issue(options[:repo], options[:number])
      end

    end
  end
end
