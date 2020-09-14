class RequestMailer < ApplicationMailer
  default from: "pqr.sistemas@gmail.com"

  def notice_request(user, pqr)
    @user = user
    @pqr = pqr
    mail(to: @user.email, subject: 'Novedad en la PQR')
  end
end
