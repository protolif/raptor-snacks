require 'aws-sdk-s3'

Aws.config.update({
  region: 'us-east-2',
  credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"])
    # Rails.application.credentials.dig(:aws, :access_key_id),
    # Rails.application.credentials.dig(:aws, :secret_access_key)
    # Using rails credentials:edit to set the AWS secrets does not work on heroku. It produces:
    # Aws::Errors::MissingCredentialsError (unable to sign request without credentials set)
})

# more info:
# visit 'https://docs.aws.amazon.com/AWSRubySDK/latest/AWS/Errors/MissingCredentialsError.html'
# click 'View Source'
# File 'lib/aws/errors.rb', line 124

# def initialize msg = nil
#   msg ||= <<-MSG
#
# Missing Credentials.
#
# Unable to find AWS credentials.  You can configure your AWS credentials
# a few different ways:
#
# * Call AWS.config with :access_key_id and :secret_access_key
#
# * Export AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to ENV
#
# * On EC2 you can run instances with an IAM instance profile and credentials
#   will be auto loaded from the instance metadata service on those
#   instances.
#
# * Call AWS.config with :credential_provider.  A credential provider should
#   either include AWS::Core::CredentialProviders::Provider or respond to
#   the same public methods.
#
# = Ruby on Rails
#
# In a Ruby on Rails application you may also specify your credentials in
# the following ways:
#
# * Via a config initializer script using any of the methods mentioned above
#   (e.g. RAILS_ROOT/config/initializers/aws-sdk.rb).
#
# * Via a yaml configuration file located at RAILS_ROOT/config/aws.yml.
#   This file should be formated like the default RAILS_ROOT/config/database.yml
#   file.
