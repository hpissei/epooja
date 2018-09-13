class Sendmail
  require 'sendgrid-ruby'
  include SendGrid

  def self.call
      puts ">>>>>>>>>>>>>>>>>>sendmail2>>>>>>>>>>>>>>>>>>>>>>>>>>>"

data = JSON.parse('
  {
     "personalizations":[
        {
           "to":[
              {
                 "email":"hpultimatemedia@gmail.com",
                 "name":"John Doe"
              }
           ],
           "dynamic_template_data":{
              "user_email":"temp@gma",
              "user_email_confirm_token":"token"
           }
        }
     ],
     "from":{
        "email":"hpultimatemedia@gmail.com",
        "name":"Alex"
     },
     "reply_to":{
        "email":"no-reply@hpultimatemedia.com",
        "name":"Angel Perez"
     },
     "template_id":"d-ea94a31d1ff84a328f3fd9b535b8b54e",
     "user_email":"tempdfsfsdd",
     "user_email_confirm_token":"tokendatatdsjd;sjLKDJSldkjsdljsdljd?",
     "request_base_url":"localhoist"
  }',quirks_mode: true)
#'request_base_url':"Application.root"
sg = SendGrid::API.new(api_key: ENV["SENDGRID"].to_s)#{}"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")
response = sg.client.mail._("send").post(request_body: data)
puts response.status_code
puts response.body
  #puts response.parsed_body
  #puts response.headers
  end
end
