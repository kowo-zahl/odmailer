module Spree
  class OdMailer < BaseMailer
   
    def confirm_email(order, email)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      subject = "#{Spree::Store.current.name} Bestellung ##{@order.number}"
      mail(to: email, from: from_address, subject: subject)
    end


  end
end
