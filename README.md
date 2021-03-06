# GithubFlo
[![Gem Version](https://badge.fury.io/rb/github_flo.svg)](https://badge.fury.io/rb/github_flo) [![Code Climate](https://codeclimate.com/github/salesforce/github_flo/badges/gpa.svg)](https://codeclimate.com/github/salesforce/github_flo) [![Build Status](https://semaphoreci.com/api/v1/justinpowers/github_flo/branches/master/shields_badge.svg)](https://semaphoreci.com/justinpowers/github_flo)

GithubFlo is a Salesforce plugin for the Flo workflow automation library.  If you aren't familiar with Flo, then please start [here](https://github.com/salesforce/flo)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'github_flo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install github_flo

## Configuration

In your Flo configuration file, configure salesforce inside the `config` block

```ruby
config do |cfg|
  cfg.provider :github_flo, { user: ENV['OCTOKIT_TEST_USER'], token: ENV['OCTOKIT_TEST_TOKEN'], repo: 'salesforce/github_flo' }
end
```

See the [Octokit gem](https://github.com/octokit/octokit.rb#authentication) for information on setting up the client.

## Usage

Specify the commands you wish to run in the `register_command` block.  For example
```ruby
# Updates a github issue
perform :github_flo, :update_issue, { number: number, assignee: assignee }

# Adds a label to an issue
perform :github_flo, :add_labels_to_an_issue, { number: number, labels: ["Work in progress"] }

# Idempotently creates a pull request 
perform :github_flo, :create_pull_request, { base: 'master', branch: "issues/#{number}", title: "Fixes #{number}", body: 'Some important details' }
```

## Contributing

1. Fork it (http://github.com/your-github-username/github_flo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

>Copyright (c) 2017, Salesforce.com, Inc.
>All rights reserved.
>
>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
>
>* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
>
>* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
>
>* Neither the name of Salesforce.com nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
>
>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
