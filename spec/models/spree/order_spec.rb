require 'spec_helper'
require 'rspec/active_model/mocks'

class FakeCalculator < Spree::Calculator
  def compute(computable)
    5
  end
end

describe Spree::Order, type: :model do
  let(:user) { stub_model(Spree::User, email: "spree@example.com") }
  let(:order) { stub_model(Spree::Order, user: user) }

  before do
    create(:store)
    allow(Spree::User).to receive_messages(current: mock_model(Spree::LegacyUser, id: 123))
  end
  


    it "should send an order confirmation email" do
      mail_message = double "Mail::Message"
      expect(Spree::OrderMailer).to receive(:confirm_email).with(order.id).and_return mail_message
      expect(mail_message).to receive :deliver_later
      order.finalize!
    end

    it "sets confirmation delivered when finalizing" do
      expect(order.confirmation_delivered?).to be false
      order.finalize!
      expect(order.confirmation_delivered?).to be true
    end

    it "should not send duplicate confirmation emails" do
      allow(order).to receive_messages(confirmation_delivered?: true)
      expect(Spree::OrderMailer).not_to receive(:confirm_email)
      order.finalize!
    end

end
