module Messaging
  def get_messages(value = 1)

    values = {
      "page": value,
    }

    url = "https://www.bloc.io/api/v1/message_threads"
    response = self.class.get(url, body: values, headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def create_message(sender = @user["email"], recipient_id = @mentor, subject, message)
    values = {
      "sender": sender,
      "recipient_id": recipient_id,
      "token": "efaca114-a4b5-4700-b7c6-56120f577cff",
      "subject": subject,
      "stripped-text": message
    }

    url = "https://www.bloc.io/api/v1/messages"
    response = self.class.post(url, body: values, headers: { "authorization" => @auth_token })
    puts response["message"] if response["message"]
  end
end
