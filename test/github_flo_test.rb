# Copyright © 2017, Salesforce.com, Inc.
# All Rights Reserved.
# Licensed under the BSD 3-Clause license.
# For full license text, see LICENSE.txt file in the repo root or https://opensource.org/licenses/BSD-3-Clause

require 'test_helper'

class GithubFloTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::GithubFlo::VERSION
  end
end
