class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def welcome_email(user, order, line_items)
    @user = user
    @order = order
    @line_items = line_items
    mail(to: user.email, subject: "Order id:#{order.id} Thank you for your purchase today!")
  end

  def render_items(items)
    items
  end
end
