require 'httparty'

class Kele
  attr_reader :token, :base_api
  include HTTParty
  def initialize(email, password)
    # base_uri = 'bloc.io/api/v1'
    @base_api = "https://www.bloc.io/api/v1"

    values = {
      "email": email,
      "password": password
    }

    headers = {
      :content_type => 'application/json'
    }

    response = self.class.post('https://www.bloc.io/api/v1/sessions', body: values.to_json, headers: headers)
    if response["auth_token"]
      @token = response["auth_token"]
    else
      puts response["message"]
    end


  end
end
