module Messaging
  def get_messages(value = 1)

    values = {
      "page": value,
    }

    url = "https://www.bloc.io/api/v1/message_threads"
    response = self.class.get(url, body: values, headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def create_message(subject = nil, message)
    values = {
      "sender": @user["email"],
      "recipient_id": @mentor,
      "subject": subject,
      "stripped-text": message
    }

    url = "https://www.bloc.io/api/v1/messages"
    response = self.class.post(url, body: values, headers: { "authorization" => @auth_token })
    puts response["message"] if response["message"]
    response
  end
end
