require 'rails/generators'

class ProductiveApiClientGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument :api_key, required: true, desc: 'required'
  argument :account_id, required: true, desc: 'required'

  gem 'productive_api_client'

  desc 'Configure Productive API client'

  def create_initializer_file
    unless /^[a-f0-9\-]{36}$/ =~ api_key
      raise Thor::Error, "Invalid Productive API key #{api_key.inspect}\nYou can find the API key on the Settings -> Security page of https://productive.io"
    end

    unless /^[0-9]*$/ =~ account_id
      raise Thor::Error, "Invalid Productive Account ID #{account_id.inspect}\n"
    end

    initializer 'productive_api_client.rb' do
      <<-EOF
ProductiveApiClient.configure do |config|
  config.api_key = #{api_key.inspect}
  config.account_id = #{account_id.inspect}
end
      EOF
    end
  end
end
