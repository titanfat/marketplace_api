class OerderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.oerder_mailer.send_confirmation.subject
  #
  def send_confirmation(order)
    default from: 'tit22an@gmail.com'
    @order = order
    @user = @order.user
    mail to: @user.email, subject: 'Order Confirmation'
  end
end
