class OrderMailer < ApplicationMailer
  default from: "mkateboflo1@gmail.com"

   def new_order_email(receipt)
       @receipt = receipt

    attachments['receipt1.png'] = File.read('app/assets/images/receipt1.png')

    #   mail to: User.first.email, cc: User.all.pluck(:email), subject: "Order Approval!"
    mail(to: "loreydjefwa@gmail.com",
         cc: User.all.pluck(:email),
         subject: "Order Approval!")
    #  mail(to: "jannylynemiaz@gmail.com", subject: "Order Approval!")

  end
end
