module ApplicationHelper
  require 'sendgrid-ruby'
  include SendGrid

 def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-error"
          when :alert then "alert alert-error"
      end
  end

#welcome email template
def welcome_email
    render_to_string 'user_mailer/email/welcome/welcome_email'
end


def send_mail(user)
  body = self.welcome_email
  from = Email.new(email: 'hpultimatemedia@gmail.com')
  to = Email.new(email: user[:user][:email])
  subject = 'Welcome to Epooja'
  content = Content.new(type: 'text/html', value: body )
  mail = Mail.new(from, subject, to, content)
  #to replace with environment variable
  sg = SendGrid::API.new(api_key: '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')
  response = sg.client.mail._('send').post(request_body: mail.to_json)
  puts response.status_code
  puts response.body
  puts response.headers
end

end
