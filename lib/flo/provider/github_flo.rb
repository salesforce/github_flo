require 'octokit'

module Flo
  module Provider
    class GithubFlo

      def initialize(opts={})
        username = opts[:user]
        token = opts[:token]
        @repo = opts[:repo]

        @client = opts[:client] || Octokit::Client.new(login: username, password: token)
      end

      def update_issue(opts={})
        options = {repo: @repo}.merge(opts)
        @client.update_issue(options.delete(:repo), options.delete(:number), options)
        OpenStruct.new(success?: true)
      end

      def add_labels_to_an_issue(opts={})
        options = {repo: @repo}.merge(opts)
        @client.add_labels_to_an_issue(options.delete(:repo), options.delete(:number), options[:labels])
        OpenStruct.new(success?: true)
      end

    end
  end
end
