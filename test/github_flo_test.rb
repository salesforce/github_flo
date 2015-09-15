require 'test_helper'

class GithubFloTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GithubFlo::VERSION
  end
end
