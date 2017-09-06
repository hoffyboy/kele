require 'httparty'
require 'json'

class Kele
  attr_reader :token, :base_api
  include HTTParty

  def initialize(email, password)
    @base_api = "https://www.bloc.io/api/v1"

    values = {
      "email": email,
      "password": password
    }

    headers = {
      :content_type => 'application/json'
    }

    url = 'https://www.bloc.io/api/v1/sessions'
    response = self.class.post(url, body: values.to_json, headers: headers)
    if response["auth_token"]
      @auth_token = response["auth_token"]
    else
      puts response["message"]
    end
  end

  def get_me
    url = 'https://www.bloc.io/api/v1/users/me'
    response = self.class.get(url, headers: { "authorization" => @auth_token })
    user = JSON.parse(response.body)
  end

  def get_mentor_availability
    user = get_me
    mentor_id = user["current_enrollment"]["mentor_id"]
    url = "https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability"
    response = self.class.get(url, headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end
end
