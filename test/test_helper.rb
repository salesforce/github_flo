$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'github_flo'

ENV["MT_NO_SKIP_MSG"] = "true"

require 'minitest/autorun'
require 'pry'

module GithubFlo
  class UnitTest < Minitest::Test
    self.parallelize_me!
  end
end

def test_github_user
  ENV.fetch 'OCTOKIT_TEST_USER', 'x' * 9
end

def test_github_token
  ENV.fetch 'OCTOKIT_TEST_TOKEN', 'x' * 40
end
