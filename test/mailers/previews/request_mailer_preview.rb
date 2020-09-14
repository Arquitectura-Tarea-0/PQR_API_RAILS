# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def notice_request_preview
    RequestMailer.notice_request(User.first, Request.first)
  end
end
