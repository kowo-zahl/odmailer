module Spree
  Order.class_eval do
     alias_method :deliver_order_confirmation_email_old, :deliver_order_confirmation_email

    def deliver_order_confirmation_email
      deliver_order_confirmation_email_old
      emails = Spree::Odmailer.all
      emails.each do |email|
        OdMailer.confirm_email(id,email.email).deliver_later
      end
    end
  end
end